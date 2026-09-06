class YandexCli < Formula
  desc "Stateful CLI for Yandex Tracker and Yandex Wiki"
  homepage "https://github.com/AntonLisovoy/yandex-cli"
  version "1.2.1"
  license "Apache-2.0"

  # Only the two published targets get a url. An unsupported platform - Intel
  # macOS, ARM Linux - then fails at `brew install` with no available download,
  # instead of installing a binary that dies with "Bad CPU type" on first run.
  on_macos do
    on_arm do
      url "https://github.com/AntonLisovoy/yandex-cli/releases/download/v1.2.1/yandex-cli-1.2.1-macos-arm64.tar.gz"
      sha256 "a4f61cd930e81df938be1fd89dd25d15aa6b959c00b99e56a864da2e872e810f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/AntonLisovoy/yandex-cli/releases/download/v1.2.1/yandex-cli-1.2.1-linux-x86_64.tar.gz"
      sha256 "8104079b1810e6e2be513a8313b1ab43e52c35280dcbdf68b33254e59c306b2b"
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
