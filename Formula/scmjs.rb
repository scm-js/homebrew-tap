# The formula for a tap (github.com/scm-js/homebrew-tap, Formula/scmjs.rb): `brew install scm-js/tap/scmjs`.
# It installs the release's single executable, Node inside it; nothing is built and no bottle is needed.
class Scmjs < Formula
  desc "StarCraft: Brood War maps, replays and bots from the command line"
  homepage "https://docs.scmjs.dev/cli/"
  version "0.12.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/scm-js/scm-js/releases/download/v0.12.1/scmjs-cli-macos-arm64.tar.gz"
      sha256 "65f511cd242936d13b84e34ea62e1e8e8812085852a711fac86753fd96da169d"
    end
    on_intel do
      url "https://github.com/scm-js/scm-js/releases/download/v0.12.1/scmjs-cli-macos-x64.tar.gz"
      sha256 "f75f9b1e75296487dc6e113e376c88b5fba606efccf6b4dae73efb0f0e84be6c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/scm-js/scm-js/releases/download/v0.12.1/scmjs-cli-linux-x64.tar.gz"
      sha256 "552f85f56869672014359e1650c5aa434e41bd3f4ab9e2196c540de1888e5b0f"
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
