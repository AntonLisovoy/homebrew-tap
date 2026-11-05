class YandexCli < Formula
  desc "Stateful CLI for Yandex Tracker and Yandex Wiki"
  homepage "https://github.com/AntonLisovoy/yandex-cli"
  version "1.6.0"
  license "Apache-2.0"

  # Only the two published targets get a url. An unsupported platform - Intel
  # macOS, ARM Linux - then fails at `brew install` with no available download,
  # instead of installing a binary that dies with "Bad CPU type" on first run.
  on_macos do
    on_arm do
      url "https://github.com/AntonLisovoy/yandex-cli/releases/download/v1.6.0/yandex-cli-1.6.0-macos-arm64.tar.gz"
      sha256 "57102b9e3f6d20a517b00946ffce1c4c6ac05ba2a736eaa9bf88f6706f3e87c1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/AntonLisovoy/yandex-cli/releases/download/v1.6.0/yandex-cli-1.6.0-linux-x86_64.tar.gz"
      sha256 "a6e7d0fff9f801adf30f79283571e86f448a81fb98f3176dba7fe4b421b0e2a4"
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
