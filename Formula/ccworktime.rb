class Ccworktime < Formula
  desc "Calculate work time from Claude Code session logs"
  homepage "https://github.com/ShahadIshraq/ccworktime"
  version "0.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ShahadIshraq/ccworktime/releases/download/v0.0.1/ccworktime-darwin-arm64.tar.gz"
      sha256 "ef2f54582a9ca2517804bc9e5b9cb5525fa22a9d9a978cc186f8d26f3d3c2e85"
    else
      url "https://github.com/ShahadIshraq/ccworktime/releases/download/v0.0.1/ccworktime-darwin-x64.tar.gz"
      sha256 "f1ac711564fafc9870748e332add7e954e578ee4c5050bf6f9f95583abb80ea9"
    end
  end

  on_linux do
    url "https://github.com/ShahadIshraq/ccworktime/releases/download/v0.0.1/ccworktime-linux-x64.tar.gz"
    sha256 "593de428f2dbb031c04804e5773e4a3dde54a3252ab0c9a78ced253a159845cc"
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
