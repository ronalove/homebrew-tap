class Ccfaststatus < Formula
  desc "The Fastest Status Line for Claude Code, développée en Rust"
  homepage "https://github.com/r9r-dev/ccfaststatus"
  version "0.2.0"
  license "WTFPL"

  depends_on :macos
  depends_on arch: :arm64

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/r9r-dev/ccfaststatus/releases/download/v0.2.0/ccfaststatus-0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "ac96123e2238786d8f813f2bb41053e8947727b21983588660936afdef33f307"
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
