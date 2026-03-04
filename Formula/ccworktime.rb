class Ccworktime < Formula
  desc "Calculate work time from Claude Code session logs"
  homepage "https://github.com/ShahadIshraq/ccworktime"
  version "0.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ShahadIshraq/ccworktime/releases/download/v0.0.2/ccworktime-darwin-arm64.tar.gz"
      sha256 "41370eba732f08f7c24ad745e782b3ae12d04b88c3d3562c2a03b02992cbdc0b"
    else
      url "https://github.com/ShahadIshraq/ccworktime/releases/download/v0.0.2/ccworktime-darwin-x64.tar.gz"
      sha256 "e1c62f8490b2bb5c092f9de77683dd2276fd1b23fd337c9681abab8356575698"
    end
  end

  on_linux do
    url "https://github.com/ShahadIshraq/ccworktime/releases/download/v0.0.2/ccworktime-linux-x64.tar.gz"
    sha256 "0f89d7d6fb566ca0e93d5696e2c8973c732c3ee30f1dbabb0b294faab96ddf9c"
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
