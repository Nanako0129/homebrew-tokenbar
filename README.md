# homebrew-tokenbar

Homebrew tap for [**TokenBar**](https://github.com/Nanako0129/TokenBar) — an AI
token usage monitor for the macOS menu bar.

```sh
brew tap nanako0129/tokenbar
brew install --cask tokenbar
```

Homebrew lowercases the tap owner, so the tap is `nanako0129/tokenbar` (this repo
is `Nanako0129/homebrew-tokenbar`). Recent Homebrew requires the explicit
`brew tap` before installing a third-party cask.

The cask (`Casks/tokenbar.rb`) is bumped automatically by TokenBar's release
workflow on each tagged release — `version` and `sha256` are patched to point at
the new DMG. Requires Apple Silicon, macOS 11+.
