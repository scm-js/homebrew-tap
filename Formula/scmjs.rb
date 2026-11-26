# The formula for a tap (github.com/scm-js/homebrew-tap, Formula/scmjs.rb): `brew install scm-js/tap/scmjs`.
# It installs the release's single executable, Node inside it; nothing is built and no bottle is needed.
class Scmjs < Formula
  desc "StarCraft: Brood War maps, replays and bots from the command line"
  homepage "https://docs.scmjs.dev/cli/"
  version "0.19.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/scm-js/scm-js/releases/download/v0.19.0/scmjs-cli-macos-arm64.tar.gz"
      sha256 "e0f446a9f281fbb4dcdf4893e0f420eb2d52b595a9d54bfbc7ba957efb95b4ee"
    end
    on_intel do
      url "https://github.com/scm-js/scm-js/releases/download/v0.19.0/scmjs-cli-macos-x64.tar.gz"
      sha256 "c995feb7f7c5fa84bc3380b2c18e300dd54d861d5e1aa4cad423546ada68cdd9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/scm-js/scm-js/releases/download/v0.19.0/scmjs-cli-linux-x64.tar.gz"
      sha256 "ddad4a396d7409f87bd89beb518b4c64a10854697ca50b8686fa8dc74c490581"
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
