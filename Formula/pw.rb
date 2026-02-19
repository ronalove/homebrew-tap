class Pw < Formula
  desc "A fast, secure CLI password generator"
  homepage "https://github.com/r9r-dev/pw"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/r9r-dev/pw/releases/download/v0.1.1/pw-aarch64-apple-darwin.tar.gz"
      sha256 "87ef62c29cf1f8a83aa005064d60e69688fe52d2dd8925d6802a331f4374bc17"
    else
      url "https://github.com/r9r-dev/pw/releases/download/v0.1.1/pw-x86_64-apple-darwin.tar.gz"
      sha256 "5a09ced99eedd05663eea24135b2fb11fad361a664b002b4c4570ecb61aa417c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/r9r-dev/pw/releases/download/v0.1.1/pw-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b966016e0d204fb2623dee2b11c6e42a0502e3b7910cac15175075d918c2624f"
    else
      url "https://github.com/r9r-dev/pw/releases/download/v0.1.1/pw-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6024e519e24f8e6e394359f05f00b4bc25e1d5b67e17b42fdfb1f68a08e389e2"
    end
  end

  def install
    bin.install "pw"
  end

  test do
    assert_match(/\S{16}/, shell_output("#{bin}/pw -q"))
  end
end
