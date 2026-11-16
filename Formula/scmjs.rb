# The formula for a tap (github.com/scm-js/homebrew-tap, Formula/scmjs.rb): `brew install scm-js/tap/scmjs`.
# It installs the release's single executable, Node inside it; nothing is built and no bottle is needed.
class Scmjs < Formula
  desc "StarCraft: Brood War maps, replays and bots from the command line"
  homepage "https://docs.scmjs.dev/cli/"
  version "0.15.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/scm-js/scm-js/releases/download/v0.15.0/scmjs-cli-macos-arm64.tar.gz"
      sha256 "9cc33c42cc689aabd3c9ce01c0d029d09c7bd12600ace06bf80ae83dc259638b"
    end
    on_intel do
      url "https://github.com/scm-js/scm-js/releases/download/v0.15.0/scmjs-cli-macos-x64.tar.gz"
      sha256 "48ea440e2e9487a5b8fdedf0b348bfc0cd7b978ced680820097520096cb5bd41"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/scm-js/scm-js/releases/download/v0.15.0/scmjs-cli-linux-x64.tar.gz"
      sha256 "b722b24a58e5084241a9361ec47ba4b39e0bea75a7d73a31ed9a68a5caa9a996"
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
