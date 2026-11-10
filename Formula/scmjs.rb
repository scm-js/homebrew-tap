# The formula for a tap (github.com/scm-js/homebrew-tap, Formula/scmjs.rb): `brew install scm-js/tap/scmjs`.
# It installs the release's single executable, Node inside it; nothing is built and no bottle is needed.
class Scmjs < Formula
  desc "StarCraft: Brood War maps, replays and bots from the command line"
  homepage "https://docs.scmjs.dev/cli/"
  version "0.13.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/scm-js/scm-js/releases/download/v0.13.1/scmjs-cli-macos-arm64.tar.gz"
      sha256 "f1a88f901983a52b1b1b9b4c5efcaf537d3218e86774e38d90633b7eb79cb3e4"
    end
    on_intel do
      url "https://github.com/scm-js/scm-js/releases/download/v0.13.1/scmjs-cli-macos-x64.tar.gz"
      sha256 "d6ef45024cc7f6c2337ce67a67a837c2baed36d713425e4791f8fafabd24d58a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/scm-js/scm-js/releases/download/v0.13.1/scmjs-cli-linux-x64.tar.gz"
      sha256 "0900893489e41bcc417236a2ac32b537ca09728c8dc13859cfa5c2757fb67927"
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
