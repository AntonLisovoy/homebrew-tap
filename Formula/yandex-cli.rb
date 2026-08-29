class YandexCli < Formula
  desc "Stateful CLI for Yandex Tracker and Yandex Wiki"
  homepage "https://github.com/AntonLisovoy/yandex-cli"
  version "1.0.1"
  license "Apache-2.0"

  # Only the two published targets get a url. An unsupported platform - Intel
  # macOS, ARM Linux - then fails at `brew install` with no available download,
  # instead of installing a binary that dies with "Bad CPU type" on first run.
  on_macos do
    on_arm do
      url "https://github.com/AntonLisovoy/yandex-cli/releases/download/v1.0.1/yandex-cli-1.0.1-macos-arm64.tar.gz"
      sha256 "8ce60f9495731ea7bb5c363096de64250e8546962302d4a8140d50b5ea687c79"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/AntonLisovoy/yandex-cli/releases/download/v1.0.1/yandex-cli-1.0.1-linux-x86_64.tar.gz"
      sha256 "0d47777d4d904bd688171077337c8826848e959fe394f8ab731bec25e78ffd66"
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
