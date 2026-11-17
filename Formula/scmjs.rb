# The formula for a tap (github.com/scm-js/homebrew-tap, Formula/scmjs.rb): `brew install scm-js/tap/scmjs`.
# It installs the release's single executable, Node inside it; nothing is built and no bottle is needed.
class Scmjs < Formula
  desc "StarCraft: Brood War maps, replays and bots from the command line"
  homepage "https://docs.scmjs.dev/cli/"
  version "0.17.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/scm-js/scm-js/releases/download/v0.17.0/scmjs-cli-macos-arm64.tar.gz"
      sha256 "0200a70a3822e1ec9c316a946a3f93fb171c5ab777e082f511820f8bcba63046"
    end
    on_intel do
      url "https://github.com/scm-js/scm-js/releases/download/v0.17.0/scmjs-cli-macos-x64.tar.gz"
      sha256 "78d5a992f6e1127e1fe3e51dd4c2cb5d41185437d56b69d764600e26b699afa6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/scm-js/scm-js/releases/download/v0.17.0/scmjs-cli-linux-x64.tar.gz"
      sha256 "acfabb6e3610f64c41a93f09320096a07a0ed226647585002931b4ab191ab036"
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
