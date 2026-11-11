# The formula for a tap (github.com/scm-js/homebrew-tap, Formula/scmjs.rb): `brew install scm-js/tap/scmjs`.
# It installs the release's single executable, Node inside it; nothing is built and no bottle is needed.
class Scmjs < Formula
  desc "StarCraft: Brood War maps, replays and bots from the command line"
  homepage "https://docs.scmjs.dev/cli/"
  version "0.13.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/scm-js/scm-js/releases/download/v0.13.3/scmjs-cli-macos-arm64.tar.gz"
      sha256 "a6ae4556e3478296272025b3d154b00325e7f3050da296ee03f8197555bb2938"
    end
    on_intel do
      url "https://github.com/scm-js/scm-js/releases/download/v0.13.3/scmjs-cli-macos-x64.tar.gz"
      sha256 "4355b351c868e53d64ba16cdc9d7af15151b273a7e9818364eee070a1733a201"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/scm-js/scm-js/releases/download/v0.13.3/scmjs-cli-linux-x64.tar.gz"
      sha256 "357c4fcfc0a90552a5a7198edeaa31df918d4eeafcbe4c4803c0f18d966092c5"
    end
  end

  livecheck do
    url :stable
    strategy :github_latest
  end

  def install
    bin.install "scmjs"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/scmjs --version")
  end
end
