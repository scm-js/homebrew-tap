# scm-js/homebrew-tap

A [Homebrew](https://brew.sh) tap for `scmjs`, the [scmJS](https://scmjs.dev) command line for
StarCraft: Brood War maps, replays and bots, on macOS and Linux.

```sh
brew install scm-js/tap/scmjs
```

The formula installs the single executable of the newest release of
[scm-js/scm-js](https://github.com/scm-js/scm-js); nothing is compiled. The command line's guide is
at [docs.scmjs.dev/cli](https://docs.scmjs.dev/cli/).

The formula follows each release by itself: every few hours `.github/workflows/update.yml` looks for a
newer release, fills the formula from scm-js's recipe at that release, installs and tests it, and
pushes it. `brew upgrade scmjs` then gets it.
