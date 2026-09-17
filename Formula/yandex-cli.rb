class YandexCli < Formula
  desc "Stateful CLI for Yandex Tracker and Yandex Wiki"
  homepage "https://github.com/AntonLisovoy/yandex-cli"
  version "1.3.0"
  license "Apache-2.0"

  # Only the two published targets get a url. An unsupported platform - Intel
  # macOS, ARM Linux - then fails at `brew install` with no available download,
  # instead of installing a binary that dies with "Bad CPU type" on first run.
  on_macos do
    on_arm do
      url "https://github.com/AntonLisovoy/yandex-cli/releases/download/v1.3.0/yandex-cli-1.3.0-macos-arm64.tar.gz"
      sha256 "8299988442aa3684532e15117fd1c15353c77ac6233c19c5cce31f54e4738840"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/AntonLisovoy/yandex-cli/releases/download/v1.3.0/yandex-cli-1.3.0-linux-x86_64.tar.gz"
      sha256 "10064dc81222dfec2064d5c71413802039bc8cc0a93b7cfe93601d6cf0e60bc4"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"yandex"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/yandex --version")
  end
end
