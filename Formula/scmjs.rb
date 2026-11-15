# The formula for a tap (github.com/scm-js/homebrew-tap, Formula/scmjs.rb): `brew install scm-js/tap/scmjs`.
# It installs the release's single executable, Node inside it; nothing is built and no bottle is needed.
class Scmjs < Formula
  desc "StarCraft: Brood War maps, replays and bots from the command line"
  homepage "https://docs.scmjs.dev/cli/"
  version "0.14.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/scm-js/scm-js/releases/download/v0.14.1/scmjs-cli-macos-arm64.tar.gz"
      sha256 "3a03108d780c000c25165266562a25cda8e78016f6a997a2b5683a4688057a17"
    end
    on_intel do
      url "https://github.com/scm-js/scm-js/releases/download/v0.14.1/scmjs-cli-macos-x64.tar.gz"
      sha256 "5d2438b0417287aa2086632523b4c2f197ae01d8aac3e1d11ea0841c7ea942df"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/scm-js/scm-js/releases/download/v0.14.1/scmjs-cli-linux-x64.tar.gz"
      sha256 "61fa38291d954041c93afc7ec2e12f1beda8bd704c929597facdc2a7e9196da8"
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
