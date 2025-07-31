require "language/node"

class ClaudeCode < Formula

  @version = "1.0.64"
  
  desc "Command line interface for Claude AI by Anthropic"
  homepage "https://www.anthropic.com"
  url "https://registry.npmjs.org/@anthropic-ai/claude-code/-/claude-code-#{@version}.tgz"
  sha256 "0c85902d2c081a26e6b37c8261bb7f93e16708349e73b5ec9b59af81cb6f8540"
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
