# The formula for a tap (github.com/scm-js/homebrew-tap, Formula/scmjs.rb): `brew install scm-js/tap/scmjs`.
# It installs the release's single executable, Node inside it; nothing is built and no bottle is needed.
class Scmjs < Formula
  desc "StarCraft: Brood War maps, replays and bots from the command line"
  homepage "https://docs.scmjs.dev/cli/"
  version "0.13.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/scm-js/scm-js/releases/download/v0.13.2/scmjs-cli-macos-arm64.tar.gz"
      sha256 "bdda11e63589ecf64ee90ac794fa996b2b19eb9a5302d8056d370759b5331b28"
    end
    on_intel do
      url "https://github.com/scm-js/scm-js/releases/download/v0.13.2/scmjs-cli-macos-x64.tar.gz"
      sha256 "0ca8818d1a08bdc90e662b69e095fff77b0393c6e27012739df4bca7e3fa4a7c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/scm-js/scm-js/releases/download/v0.13.2/scmjs-cli-linux-x64.tar.gz"
      sha256 "8d29555d59acfc079e900a12bf1384f25e08ba46e4e317945f3ecfc28856a75f"
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
