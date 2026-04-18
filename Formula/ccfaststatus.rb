class Ccfaststatus < Formula
  desc "The Fastest Status Line for Claude Code, développée en Rust"
  homepage "https://github.com/r9r-dev/ccfaststatus"
  version "0.4.0"
  license "WTFPL"

  depends_on :macos
  depends_on arch: :arm64

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/r9r-dev/ccfaststatus/releases/download/v0.4.0/ccfaststatus-0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "cfe61364c0616b856ac8654fc3b2075fd92d72150e0ffe616129f8ade45e64a6"
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
