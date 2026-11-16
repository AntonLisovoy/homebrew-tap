class Smena < Formula
  desc "Task management CLI that keeps AI agent context durable across sessions"
  homepage "https://github.com/AntonLisovoy/smena-cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/AntonLisovoy/smena-cli/releases/download/v0.1.0/smena_0.1.0_darwin_arm64.tar.gz"
      sha256 "361f41d5d3134377dcc78625cc47e84bf7ea2c4ee57d006e274d1c3c3c5bd6f0"
    end
    on_intel do
      url "https://github.com/AntonLisovoy/smena-cli/releases/download/v0.1.0/smena_0.1.0_darwin_amd64.tar.gz"
      sha256 "d35d8092e15651b35fba17afa606bd139b9a314ac09a347f4e9e8bbde73ed54a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AntonLisovoy/smena-cli/releases/download/v0.1.0/smena_0.1.0_linux_arm64.tar.gz"
      sha256 "3da437139187286216ae3d791601d3fdbff757a3f97709b3eeba07261abf8133"
    end
    on_intel do
      url "https://github.com/AntonLisovoy/smena-cli/releases/download/v0.1.0/smena_0.1.0_linux_amd64.tar.gz"
      sha256 "7770a06e2f436630494daa6179df1bf524f0ed1479ace4bd7826ae4dd091b097"
    end
  end

  def install
    bin.install "smena"
    generate_completions_from_executable(bin/"smena", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/smena --version")
  end
end
