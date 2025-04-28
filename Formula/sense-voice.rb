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

    bin.install "build/bin/sense-voice-main" => "sense-voice"
    lib.install Dir["build/lib/*.dylib"]

    # 修复 sense-voice 中对 dylib 的引用
    dylibs = Dir["#{lib}/*.dylib"]
    dylibs.each do |dylib|
      system "install_name_tool", "-change", "@rpath/#{File.basename(dylib)}", "@loader_path/../lib/#{File.basename(dylib)}", "#{bin}/sense-voice"
    end

    # 修复各个 dylib 之间的引用
    dylibs.each do |target_dylib|
      dylibs.each do |referenced_dylib|
        referenced_basename = File.basename(referenced_dylib)
        system "install_name_tool", "-change", "@rpath/#{referenced_basename}", "@loader_path/#{referenced_basename}", target_dylib
      end
    end

    # 给 sense-voice 增加 rpath
    system "install_name_tool", "-add_rpath", "@loader_path/../lib", "#{bin}/sense-voice"
  end

  test do
    system "#{bin}/sense-voice", "--help"
  end
end



