class HolstCli < Formula
  desc "CLI for the Holst collaborative whiteboard"
  homepage "https://github.com/AntonLisovoy/holst-cli"
  version "1.2.0"

  # Only the two published targets get a url. An unsupported platform - Intel
  # macOS, ARM Linux - then fails at `brew install` with no available download,
  # instead of installing a binary that dies with "Bad CPU type" on first run.
  on_macos do
    on_arm do
      url "https://github.com/AntonLisovoy/holst-cli/releases/download/v1.2.0/holst-cli-1.2.0-macos-arm64.tar.gz"
      sha256 "f2737b5f3601a2d23284210867901a792e0967c61cd14e2d602a08954b1da1b3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/AntonLisovoy/holst-cli/releases/download/v1.2.0/holst-cli-1.2.0-linux-x86_64.tar.gz"
      sha256 "097d33d639e7697786f0b46f22633093a5531c562505c50dec9e61dfc0354842"
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
