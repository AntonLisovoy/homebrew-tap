class YandexCli < Formula
  desc "Stateful CLI for Yandex Tracker and Yandex Wiki"
  homepage "https://github.com/AntonLisovoy/yandex-cli"
  version "1.1.0"
  license "Apache-2.0"

  # Only the two published targets get a url. An unsupported platform - Intel
  # macOS, ARM Linux - then fails at `brew install` with no available download,
  # instead of installing a binary that dies with "Bad CPU type" on first run.
  on_macos do
    on_arm do
      url "https://github.com/AntonLisovoy/yandex-cli/releases/download/v1.1.0/yandex-cli-1.1.0-macos-arm64.tar.gz"
      sha256 "9b70ad8edd3618e021b8ed2ca5f84e0b3a0165e310e6a1d652e1bbe205c886aa"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/AntonLisovoy/yandex-cli/releases/download/v1.1.0/yandex-cli-1.1.0-linux-x86_64.tar.gz"
      sha256 "c05d06c42349d281754b87393950af136949bb3cf6de30c4de2a9c4d2ed32179"
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
