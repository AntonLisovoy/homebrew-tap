class YandexCli < Formula
  desc "Stateful CLI for Yandex Tracker and Yandex Wiki"
  homepage "https://github.com/AntonLisovoy/yandex-cli"
  version "1.4.0"
  license "Apache-2.0"

  # Only the two published targets get a url. An unsupported platform - Intel
  # macOS, ARM Linux - then fails at `brew install` with no available download,
  # instead of installing a binary that dies with "Bad CPU type" on first run.
  on_macos do
    on_arm do
      url "https://github.com/AntonLisovoy/yandex-cli/releases/download/v1.4.0/yandex-cli-1.4.0-macos-arm64.tar.gz"
      sha256 "1bba82bfd5410bde699905c1004aee6b62699b75ae808388e6a9820ea26d2358"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/AntonLisovoy/yandex-cli/releases/download/v1.4.0/yandex-cli-1.4.0-linux-x86_64.tar.gz"
      sha256 "55047185f36d43d487a7c6448fe6b22d723c600860aaf2a1959866ded6d7f316"
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
