class YandexCli < Formula
  desc "Stateful CLI for Yandex Tracker and Yandex Wiki"
  homepage "https://github.com/AntonLisovoy/yandex-cli"
  version "1.5.0"
  license "Apache-2.0"

  # Only the two published targets get a url. An unsupported platform - Intel
  # macOS, ARM Linux - then fails at `brew install` with no available download,
  # instead of installing a binary that dies with "Bad CPU type" on first run.
  on_macos do
    on_arm do
      url "https://github.com/AntonLisovoy/yandex-cli/releases/download/v1.5.0/yandex-cli-1.5.0-macos-arm64.tar.gz"
      sha256 "ef11513e250d903d19356c27c0cd1c5d68f19b519935e16dae315ca4fcbe5581"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/AntonLisovoy/yandex-cli/releases/download/v1.5.0/yandex-cli-1.5.0-linux-x86_64.tar.gz"
      sha256 "705a4e7e6b8f2d91ecf6c59c812199d8665e65c4d46e2caf051e136495f2d851"
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
