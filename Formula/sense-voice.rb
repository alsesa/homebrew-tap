class SenseVoice < Formula
  desc "A tool for voice recognition"
  homepage "https://github.com/lovemefan/SenseVoice.cpp"
  url "https://github.com/lovemefan/SenseVoice.cpp.git", branch: "main"
  sha256 "7db9aac1da3de455da32744e8799a5390edc0e46cdf5ba4800815586d91aeebd"  # Replace with actual checksum
  version "0.1.0"
  license "MIT"

  depends_on "cmake" => :build
  depends_on "git"
  depends_on "sdl2" # 如果需要 SDL 支持

  def install
    system "git", "submodule", "update", "--init", "--recursive"
    mkdir "build" do
      system "cmake", "-DCMAKE_BUILD_TYPE=Release", "..", *std_cmake_args
      system "make", "-j#{ENV.make_jobs}"
    end

    # 安装真正的可执行文件
    bin.install "build/bin/sense-voice-main" => "sense-voice-real"

    # 安装wrapper
    (bin/"sense-voice").write <<~EOS
      #!/bin/bash
      set -e

      # 如果没有参数，或第一个参数是选项（以-开头），直接传给原程序
      if [[ $# -eq 0 ]] || [[ "$1" == -* ]]; then
        exec #{bin}/sense-voice-real "$@"
      fi

      INPUT="$1"
      shift

      if [[ ! -f "$INPUT" ]]; then
        echo "Error: File '$INPUT' not found."
        exit 1
      fi

      EXT="${INPUT##*.}"
      TMPFILE=""

      if [[ "$EXT" == "wav" ]]; then
        # 检查采样率和声道数
        SAMPLE_RATE=$(ffprobe -v error -select_streams a:0 -show_entries stream=sample_rate -of csv=p=0 "$INPUT")
        CHANNELS=$(ffprobe -v error -select_streams a:0 -show_entries stream=channels -of csv=p=0 "$INPUT")

        if [[ "$SAMPLE_RATE" == "16000" && "$CHANNELS" == "1" ]]; then
          # 完美符合
          WAV_INPUT="$INPUT"
        else
          echo "Converting WAV: Resample to 16kHz Mono..."
          TMPFILE=$(mktemp /tmp/audioXXXXXX.wav)
          ffmpeg -y -i "$INPUT" -ar 16000 -ac 1 -c:a pcm_s16le "$TMPFILE"
          WAV_INPUT="$TMPFILE"
        fi
      else
        # 非WAV直接转
        echo "Converting $INPUT to WAV using ffmpeg..."
        TMPFILE=$(mktemp /tmp/audioXXXXXX.wav)
        ffmpeg -y -i "$INPUT" -ar 16000 -ac 1 -c:a pcm_s16le "$TMPFILE"
        WAV_INPUT="$TMPFILE"
      fi

      #{bin}/sense-voice-real "$WAV_INPUT" "$@"

      if [[ -n "$TMPFILE" && -f "$TMPFILE" ]]; then
        rm -f "$TMPFILE"
      fi
    EOS

    chmod 0755, bin/"sense-voice"

    # 安装lib动态库，保证运行时找到
    lib.install Dir["build/lib/*.dylib"]

    # 修复 sense-voice-real (实际二进制文件) 中对 dylib 的引用
    dylibs = Dir["#{lib}/*.dylib"]
    dylibs.each do |dylib|
      system "install_name_tool", "-change", "@rpath/#{File.basename(dylib)}", "@loader_path/../lib/#{File.basename(dylib)}", "#{bin}/sense-voice-real"
    end

    # 修复各个 dylib 之间的引用
    dylibs.each do |target_dylib|
      dylibs.each do |referenced_dylib|
        referenced_basename = File.basename(referenced_dylib)
        system "install_name_tool", "-change", "@rpath/#{referenced_basename}", "@loader_path/#{referenced_basename}", target_dylib
      end
    end

    # 给 sense-voice-real (实际二进制文件) 增加 rpath
    system "install_name_tool", "-add_rpath", "@loader_path/../lib", "#{bin}/sense-voice-real"
  end

  test do
    system "#{bin}/sense-voice", "--help"
  end
end



