class YandexCli < Formula
  desc "Stateful CLI for Yandex Tracker and Yandex Wiki"
  homepage "https://github.com/AntonLisovoy/yandex-cli"
  version "1.0.2"
  license "Apache-2.0"

  # Only the two published targets get a url. An unsupported platform - Intel
  # macOS, ARM Linux - then fails at `brew install` with no available download,
  # instead of installing a binary that dies with "Bad CPU type" on first run.
  on_macos do
    on_arm do
      url "https://github.com/AntonLisovoy/yandex-cli/releases/download/v1.0.2/yandex-cli-1.0.2-macos-arm64.tar.gz"
      sha256 "c702e006ca23168347d7cea886b155e8cd600e67a0c732bab01b0f5bef3f9167"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/AntonLisovoy/yandex-cli/releases/download/v1.0.2/yandex-cli-1.0.2-linux-x86_64.tar.gz"
      sha256 "e63bfaca7d602197ca5c52b9b888c94743c4491a963a2119c0f199adab96848e"
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
