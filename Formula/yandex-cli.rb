class YandexCli < Formula
  desc "Stateful CLI for Yandex Tracker and Yandex Wiki"
  homepage "https://github.com/AntonLisovoy/yandex-cli"
  version "1.0.0"
  license "Apache-2.0"

  # Only the two published targets get a url. An unsupported platform - Intel
  # macOS, ARM Linux - then fails at `brew install` with no available download,
  # instead of installing a binary that dies with "Bad CPU type" on first run.
  on_macos do
    on_arm do
      url "https://github.com/AntonLisovoy/yandex-cli/releases/download/v1.0.0/yandex-cli-1.0.0-macos-arm64.tar.gz"
      sha256 "6915caf48495ed99bc6aed604edc409b1c9a1e0c9e846c44ce39c50dbb30ea3b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/AntonLisovoy/yandex-cli/releases/download/v1.0.0/yandex-cli-1.0.0-linux-x86_64.tar.gz"
      sha256 "1d0346c0fefac5c5c81fc7c77f3e2523cfbe8ce3749499ecb3a6fe70a1f8c556"
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
