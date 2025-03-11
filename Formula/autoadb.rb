# autoadb.rb
class Autoadb < Formula
  desc "Automatically execute commands when an ADB device is connected"
  homepage "https://github.com/rom1v/autoadb" # 请替换为实际的项目仓库地址
  url "https://codeload.github.com/rom1v/autoadb/zip/refs/heads/master" # 请替换为实际的项目版本压缩包地址
  sha256 "ef8d52e24d906a68c5a7df770fc6d2a13a79827fb55b410b833ae8485e66dd82" # 请替换为实际的压缩包 SHA256 哈希值
  version "0.1.0" # 添加版本号
  license "Apache-2.0"

  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release"
    bin.install "target/release/autoadb"
  end

  test do
    system "#{bin}/autoadb", "--help"
  end
end
