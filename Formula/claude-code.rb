require "language/node"

class ClaudeCode < Formula
  desc "Command line interface for Claude AI by Anthropic"
  homepage "https://www.anthropic.com"
  url "https://registry.npmjs.org/@anthropic-ai/claude-code/-/claude-code-1.0.53.tgz"
  sha256 "3f9703dce3c86e0030be1e48c26d211547936be9c347f72efe1835c7a065100c"
  license "MIT"

  livecheck do
    url "https://registry.npmjs.org/@anthropic-ai/claude-code/latest"
    regex(/["']version["']:\s*["']([^"']+)["']/i)
  end

  depends_on "node"

  def install
    # Install the package globally within the Homebrew prefix
    system "npm", "install", "-g", "--prefix", prefix, "@anthropic-ai/claude-code@#{version}"
    # 为 ripgrep.node 文件的头部增加填充(padding)。
    # 这会给 Homebrew 自动修复链接时预留出足够的空间。
    # 我们使用 prefix 变量来确保我们操作的是安装目录中的文件。
    MachO::Tools.header_pad(prefix/"lib/node_modules/@anthropic-ai/claude-code/vendor/ripgrep/x64-darwin/ripgrep.node")
  
  end

  test do
    system bin/"claude-code", "--help"
  end
end
