require "language/node"

class ClaudeCode < Formula

  @version = "1.0.68"
  
  desc "Command line interface for Claude AI by Anthropic"
  homepage "https://www.anthropic.com"
  url "https://registry.npmjs.org/@anthropic-ai/claude-code/-/claude-code-#{@version}.tgz"
  sha356 "ca5613df880dc98ec99d76d84a1fc36c4076c5bd80e7bcd12d11801fd3c9f547"
  license "MIT"

  livecheck do
    url "https://registry.npmjs.org/@anthropic-ai/claude-code/latest"
    regex(/["']version["']:\s*["']([^"']+)["']/i)
  end

  depends_on "node"

  def install
    # Install the package globally within the Homebrew prefix
    system "npm", "install", "-g", "--prefix", prefix, "@anthropic-ai/claude-code@#{version}"
  end

  def post_install
    MachO::Tools.header_pad(prefix/"lib/node_modules/@anthropic-ai/claude-code/vendor/ripgrep/x64-darwin/ripgrep.node")
  end

  test do
    system bin/"claude-code", "--help"
  end
end
