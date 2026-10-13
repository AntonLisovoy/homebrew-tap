class HolstCli < Formula
  desc "CLI for the Holst collaborative whiteboard"
  homepage "https://github.com/AntonLisovoy/holst-cli"
  version "1.4.0"

  # Only the two published targets get a url. An unsupported platform - Intel
  # macOS, ARM Linux - then fails at `brew install` with no available download,
  # instead of installing a binary that dies with "Bad CPU type" on first run.
  on_macos do
    on_arm do
      url "https://github.com/AntonLisovoy/holst-cli/releases/download/v1.4.0/holst-cli-1.4.0-macos-arm64.tar.gz"
      sha256 "b19e0d2a458f31d1d5999929c1be594510f7a74a9b0c74a84f2df251e2b0a6b8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/AntonLisovoy/holst-cli/releases/download/v1.4.0/holst-cli-1.4.0-linux-x86_64.tar.gz"
      sha256 "ec50bd46c6772d9b43f4078a542d9fcc6c1e353e2f98ddb65cabec973e3c0f95"
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
