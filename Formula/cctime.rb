class Cctime < Formula
  desc "Calculate work time from Claude Code session logs"
  homepage "https://github.com/ShahadIshraq/cctime"
  version "0.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ShahadIshraq/cctime/releases/download/v0.0.1/cctime-darwin-arm64.tar.gz"
      sha256 "fc8acb39b7e20b186aa21260d1275157ac134d6aad8059e45d8ec15feaa3400f"
    else
      url "https://github.com/ShahadIshraq/cctime/releases/download/v0.0.1/cctime-darwin-x64.tar.gz"
      sha256 "076e5facd430418ef257f2af47f081788ea21fb2d29be7a58984bf28c9b4fb31"
    end
  end

  on_linux do
    url "https://github.com/ShahadIshraq/cctime/releases/download/v0.0.1/cctime-linux-x64.tar.gz"
    sha256 "3d5efeb52a26c8419374b351d6d2ee63542531b36279c7828390412c0f72ccee"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "cctime-darwin-arm64" => "cctime"
    elsif OS.mac?
      bin.install "cctime-darwin-x64" => "cctime"
    else
      bin.install "cctime-linux-x64" => "cctime"
    end
  end

  def caveats
    <<~EOS
      cctime reads session data from ~/.claude/
      Make sure Claude Code is installed: https://claude.ai/code
    EOS
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/cctime --help")
    assert_match version.to_s, shell_output("#{bin}/cctime --version")
  end
end
