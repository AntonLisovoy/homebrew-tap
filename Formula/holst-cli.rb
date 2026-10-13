class HolstCli < Formula
  desc "CLI for the Holst collaborative whiteboard"
  homepage "https://github.com/AntonLisovoy/holst-cli"
  version "1.5.0"

  # Only the two published targets get a url. An unsupported platform - Intel
  # macOS, ARM Linux - then fails at `brew install` with no available download,
  # instead of installing a binary that dies with "Bad CPU type" on first run.
  on_macos do
    on_arm do
      url "https://github.com/AntonLisovoy/holst-cli/releases/download/v1.5.0/holst-cli-1.5.0-macos-arm64.tar.gz"
      sha256 "4bd0eee1c28d1a232ac2b59fb7d7178f314904e2da4c48723f3f6492ae48d3ed"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/AntonLisovoy/holst-cli/releases/download/v1.5.0/holst-cli-1.5.0-linux-x86_64.tar.gz"
      sha256 "05abc43a2c95e0cf99f4175a2e2f74a9e2782c2d47a35b0ee04068851336d773"
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
