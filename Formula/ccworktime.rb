class Ccworktime < Formula
  desc "Calculate work time from Claude Code session logs"
  homepage "https://github.com/ShahadIshraq/ccworktime"
  version "0.0.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ShahadIshraq/ccworktime/releases/download/v0.0.4/ccworktime-darwin-arm64.tar.gz"
      sha256 "b9fe21520fbf62a9517df17385fbd6d7549ba4575dfaa6ea8885b21b57d94abc"
    else
      url "https://github.com/ShahadIshraq/ccworktime/releases/download/v0.0.4/ccworktime-darwin-x64.tar.gz"
      sha256 "96f9afa745d10eb6c2a70e54fd907d3ed1910fcbaf4e5535b5e73908a43b628f"
    end
  end

  on_linux do
    url "https://github.com/ShahadIshraq/ccworktime/releases/download/v0.0.4/ccworktime-linux-x64.tar.gz"
    sha256 "c09a61f7a104c1d647b084c4dec43d989bdfdbe02b2ddeb2ca5d00e55f5da53e"
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
