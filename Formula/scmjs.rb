# The formula for a tap (github.com/scm-js/homebrew-tap, Formula/scmjs.rb): `brew install scm-js/tap/scmjs`.
# It installs the release's single executable, Node inside it; nothing is built and no bottle is needed.
class Scmjs < Formula
  desc "StarCraft: Brood War maps, replays and bots from the command line"
  homepage "https://docs.scmjs.dev/cli/"
  version "0.13.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/scm-js/scm-js/releases/download/v0.13.0/scmjs-cli-macos-arm64.tar.gz"
      sha256 "963e06f273e7f291cde2b6ba2ea8ee706896540ca68e8d65eea6a80c4da145ad"
    end
    on_intel do
      url "https://github.com/scm-js/scm-js/releases/download/v0.13.0/scmjs-cli-macos-x64.tar.gz"
      sha256 "8de18222004b0aae3f3a65fb1594692f426556892166dca9315355d83375dfd3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/scm-js/scm-js/releases/download/v0.13.0/scmjs-cli-linux-x64.tar.gz"
      sha256 "665e557f563a12039ff0801542f87c9775cf01b4a200ad74bca87198eb3c96ba"
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
