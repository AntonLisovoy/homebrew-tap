class HolstCli < Formula
  desc "CLI for the Holst collaborative whiteboard"
  homepage "https://github.com/AntonLisovoy/holst-cli"
  version "1.3.0"

  # Only the two published targets get a url. An unsupported platform - Intel
  # macOS, ARM Linux - then fails at `brew install` with no available download,
  # instead of installing a binary that dies with "Bad CPU type" on first run.
  on_macos do
    on_arm do
      url "https://github.com/AntonLisovoy/holst-cli/releases/download/v1.3.0/holst-cli-1.3.0-macos-arm64.tar.gz"
      sha256 "41505ee0015d5cf66fccd875fe5d5608416a8b98e1a65a7dc1c6326e137cd64a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/AntonLisovoy/holst-cli/releases/download/v1.3.0/holst-cli-1.3.0-linux-x86_64.tar.gz"
      sha256 "4326cb49e2e5324256faf896bafa9ddfadb4175ca6ceb80614af68d481a26d6b"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"holst"
    generate_completions_from_executable(bin/"holst", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/holst --version")
  end
end
