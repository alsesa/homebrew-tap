require "language/node"

class ClaudeCode < Formula

  @version = "1.0.56"
  
  desc "Command line interface for Claude AI by Anthropic"
  homepage "https://www.anthropic.com"
  url "https://registry.npmjs.org/@anthropic-ai/claude-code/-/claude-code-#{@version}.tgz"
  sha256 "42d453efdcad2143f2883c5608b7320dfd6ffdf71ec8562c0966a6de009f0619"
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
