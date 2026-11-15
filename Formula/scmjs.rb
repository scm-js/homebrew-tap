# The formula for a tap (github.com/scm-js/homebrew-tap, Formula/scmjs.rb): `brew install scm-js/tap/scmjs`.
# It installs the release's single executable, Node inside it; nothing is built and no bottle is needed.
class Scmjs < Formula
  desc "StarCraft: Brood War maps, replays and bots from the command line"
  homepage "https://docs.scmjs.dev/cli/"
  version "0.14.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/scm-js/scm-js/releases/download/v0.14.0/scmjs-cli-macos-arm64.tar.gz"
      sha256 "722e7c3cce7137ab9c3a90d9363042982d57544a5bfeb3f483151568cb1579ce"
    end
    on_intel do
      url "https://github.com/scm-js/scm-js/releases/download/v0.14.0/scmjs-cli-macos-x64.tar.gz"
      sha256 "899b6588b8e501b8fb6ad40bf75d3d30c97db1b73b84f9ee8f3d0e461c8c4859"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/scm-js/scm-js/releases/download/v0.14.0/scmjs-cli-linux-x64.tar.gz"
      sha256 "62e3a165d0aef8a5a3aeb47150dad5e20770d5f49a18b132534097aa03156b18"
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
