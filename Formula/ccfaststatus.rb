class Ccfaststatus < Formula
  desc "The Fastest Status Line for Claude Code, développée en Rust"
  homepage "https://github.com/r9r-dev/ccfaststatus"
  version "0.6.0"
  license "WTFPL"

  depends_on :macos
  depends_on arch: :arm64

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/r9r-dev/ccfaststatus/releases/download/v0.6.0/ccfaststatus-0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "a20c7762f914f73d9fa807c360642c746e4d44495b2f201e8f9681f6d0947eb2"
    end
  end

  def install
    bin.install "ccfaststatus"
  end

  def post_install
    system bin/"ccfaststatus", "--post-install"
  end

  def caveats
    <<~EOS
      ccfaststatus s'installe automatiquement dans ~/.claude/settings.json.
      Si une statusLine tierce était présente, elle est sauvegardée dans
      ~/.claude/settings.json.bak avant remplacement.

      Pour configurer les segments, thème et skin (TUI interactive) :
        ccfaststatus

      Redémarre Claude Code après installation.
    EOS
  end

  test do
    output = pipe_output("#{bin}/ccfaststatus", "{}")
    refute_empty output.strip
  end
end
