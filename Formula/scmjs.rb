# The formula for a tap (github.com/scm-js/homebrew-tap, Formula/scmjs.rb): `brew install scm-js/tap/scmjs`.
# It installs the release's single executable, Node inside it; nothing is built and no bottle is needed.
class Scmjs < Formula
  desc "StarCraft: Brood War maps, replays and bots from the command line"
  homepage "https://docs.scmjs.dev/cli/"
  version "0.16.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/scm-js/scm-js/releases/download/v0.16.0/scmjs-cli-macos-arm64.tar.gz"
      sha256 "9fc59d32f385b101ec949ebeea122f45e3debdd97c3bf12b9ed89ebdd1717af4"
    end
    on_intel do
      url "https://github.com/scm-js/scm-js/releases/download/v0.16.0/scmjs-cli-macos-x64.tar.gz"
      sha256 "7e76d91631e7fe3b71ccf867d761bec453dab8d0584f322be3d252ef2f79cd2a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/scm-js/scm-js/releases/download/v0.16.0/scmjs-cli-linux-x64.tar.gz"
      sha256 "c46cfae8c39225719861d65737d6a17413d0f585e97e9ecc1f08a1d293d4da1f"
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
