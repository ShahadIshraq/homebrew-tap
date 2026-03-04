class Ccworktime < Formula
  desc "Calculate work time from Claude Code session logs"
  homepage "https://github.com/ShahadIshraq/ccworktime"
  version "0.0.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ShahadIshraq/ccworktime/releases/download/v0.0.3/ccworktime-darwin-arm64.tar.gz"
      sha256 "4bc2c064911753f96c0aa555ee352a967dd3977c15080a3128385edbba2d68f8"
    else
      url "https://github.com/ShahadIshraq/ccworktime/releases/download/v0.0.3/ccworktime-darwin-x64.tar.gz"
      sha256 "078a299029db9ba89faed5ecdc53ba4339d68f20b5a9e3c00a496c76686baca0"
    end
  end

  on_linux do
    url "https://github.com/ShahadIshraq/ccworktime/releases/download/v0.0.3/ccworktime-linux-x64.tar.gz"
    sha256 "82bd7b8476cc9f9b83fc4f25cc05642267d768ff58c0944fa9451291bad0f181"
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
