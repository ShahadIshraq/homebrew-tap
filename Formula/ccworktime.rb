class Ccworktime < Formula
  desc "Calculate work time from Claude Code session logs"
  homepage "https://github.com/ShahadIshraq/ccworktime"
  version "0.0.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ShahadIshraq/ccworktime/releases/download/v0.0.5/ccworktime-darwin-arm64.tar.gz"
      sha256 "86c99bd5a88b2c9e43751b87a91a00fd99f9278d8a93c56275e7d48fc6787b59"
    else
      url "https://github.com/ShahadIshraq/ccworktime/releases/download/v0.0.5/ccworktime-darwin-x64.tar.gz"
      sha256 "20be37c7491373dbd71d3820b7d09ad4ece10944172adfcb344643aeb43e6ca3"
    end
  end

  on_linux do
    url "https://github.com/ShahadIshraq/ccworktime/releases/download/v0.0.5/ccworktime-linux-x64.tar.gz"
    sha256 "d6a54cd4003458a4ae9e51b85c23b6e6b3159586f01bec2b4c9ac0031967d29a"
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
