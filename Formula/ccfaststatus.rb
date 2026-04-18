class Ccfaststatus < Formula
  desc "The Fastest Status Line for Claude Code, développée en Rust"
  homepage "https://github.com/r9r-dev/ccfaststatus"
  version "0.5.1"
  license "WTFPL"

  depends_on :macos
  depends_on arch: :arm64

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/r9r-dev/ccfaststatus/releases/download/v0.5.1/ccfaststatus-0.5.1-aarch64-apple-darwin.tar.gz"
      sha256 "a74b1557fbe2899d28360870b17c0ffe17525133de31687988777d40727eedf7"
    end
  end

  def install
    bin.install "ccfaststatus"
  end

  def caveats
    <<~EOS
      Run the following to configure your Claude Code status line:
        ccfaststatus
    EOS
  end

  test do
    output = pipe_output("#{bin}/ccfaststatus", "{}")
    refute_empty output.strip
  end
end
