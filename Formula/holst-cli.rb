class HolstCli < Formula
  desc "CLI for the Holst collaborative whiteboard"
  homepage "https://github.com/AntonLisovoy/holst-cli"
  version "1.2.1"

  # Only the two published targets get a url. An unsupported platform - Intel
  # macOS, ARM Linux - then fails at `brew install` with no available download,
  # instead of installing a binary that dies with "Bad CPU type" on first run.
  on_macos do
    on_arm do
      url "https://github.com/AntonLisovoy/holst-cli/releases/download/v1.2.1/holst-cli-1.2.1-macos-arm64.tar.gz"
      sha256 "b60373d61c21e009ff2e497a97539aee223d58b95acbe7a1ec02b69b4e262142"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/AntonLisovoy/holst-cli/releases/download/v1.2.1/holst-cli-1.2.1-linux-x86_64.tar.gz"
      sha256 "a670478211c8cf721a631a916f3c2eaa53539dd075d8a3afc09c3323cab3062e"
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
