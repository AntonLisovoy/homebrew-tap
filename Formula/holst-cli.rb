class HolstCli < Formula
  desc "CLI for the Holst collaborative whiteboard"
  homepage "https://github.com/AntonLisovoy/holst-cli"
  version "1.0.0"

  # Only the two published targets get a url. An unsupported platform - Intel
  # macOS, ARM Linux - then fails at `brew install` with no available download,
  # instead of installing a binary that dies with "Bad CPU type" on first run.
  on_macos do
    on_arm do
      url "https://github.com/AntonLisovoy/holst-cli/releases/download/v1.0.0/holst-cli-1.0.0-macos-arm64.tar.gz"
      sha256 "2a6fb2f60e45d8acca234795384b05222f3b819431d9144bdabfaa9e4c0119b4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/AntonLisovoy/holst-cli/releases/download/v1.0.0/holst-cli-1.0.0-linux-x86_64.tar.gz"
      sha256 "d02a5a0d8166ac1e18c33aaba8bbf49e8a37fe8c4d04beb8db28397d15fe629e"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"holst"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/holst --version")
  end
end
