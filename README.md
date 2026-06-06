# homebrew-tokenbar

Homebrew tap for [**TokenBar**](https://github.com/Nanako0129/TokenBar) — an AI
token usage monitor for the macOS menu bar.

```sh
brew install --cask Nanako0129/tokenbar/tokenbar
```

That fully-qualified `user/tap/cask` form auto-taps this repo
(`Nanako0129/homebrew-tokenbar`) and installs the `tokenbar` cask.

The cask (`Casks/tokenbar.rb`) is bumped automatically by TokenBar's release
workflow on each tagged release — `version` and `sha256` are patched to point at
the new DMG. Requires Apple Silicon, macOS 11+.
