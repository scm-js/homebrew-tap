# The formula for a tap (github.com/scm-js/homebrew-tap, Formula/scmjs.rb): `brew install scm-js/tap/scmjs`.
# It installs the release's single executable, Node inside it; nothing is built and no bottle is needed.
class Scmjs < Formula
  desc "StarCraft: Brood War maps, replays and bots from the command line"
  homepage "https://docs.scmjs.dev/cli/"
  version "0.18.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/scm-js/scm-js/releases/download/v0.18.0/scmjs-cli-macos-arm64.tar.gz"
      sha256 "eced99a4ae200ef170c8d95bcc1a23e4928b4ae849f6eae5cccc82df87b441d3"
    end
    on_intel do
      url "https://github.com/scm-js/scm-js/releases/download/v0.18.0/scmjs-cli-macos-x64.tar.gz"
      sha256 "b4952cea6c7c01154741297708b5cac8490382e10272581a350fc0bbd58b278f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/scm-js/scm-js/releases/download/v0.18.0/scmjs-cli-linux-x64.tar.gz"
      sha256 "8957dc774de00cc3741495069eaeddda47faa1e77dc7fef6a585c9cbe2fa8a1f"
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
