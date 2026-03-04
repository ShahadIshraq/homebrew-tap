class Ccworktime < Formula
  desc "Calculate work time from Claude Code session logs"
  homepage "https://github.com/ShahadIshraq/ccworktime"
  version "0.0.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ShahadIshraq/ccworktime/releases/download/v0.0.3/ccworktime-darwin-arm64.tar.gz"
      sha256 "e32c8b8254880d55b908decfb23573077986bf7ea4f16fdb9670e7790aa4ff2f"
    else
      url "https://github.com/ShahadIshraq/ccworktime/releases/download/v0.0.3/ccworktime-darwin-x64.tar.gz"
      sha256 "1756b753a21c32165a6e19a14316895c68663a72caec8832102c344301561018"
    end
  end

  on_linux do
    url "https://github.com/ShahadIshraq/ccworktime/releases/download/v0.0.3/ccworktime-linux-x64.tar.gz"
    sha256 "8694e84a6722c281e574a522e52ba3d826064378e9c07930251e2c16991f4adb"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "ccworktime-darwin-arm64" => "ccworktime"
    elsif OS.mac?
      bin.install "ccworktime-darwin-x64" => "ccworktime"
    else
      bin.install "ccworktime-linux-x64" => "ccworktime"
    end
  end

  def caveats
    <<~EOS
      ccworktime reads session data from ~/.claude/
      Make sure Claude Code is installed: https://claude.ai/code
    EOS
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/ccworktime --help")
    assert_match version.to_s, shell_output("#{bin}/ccworktime --version")
  end
end
