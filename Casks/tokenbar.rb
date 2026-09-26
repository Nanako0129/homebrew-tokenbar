cask "tokenbar" do
  version "1.20.2"
  sha256 "5467d5149efd54a746022c6e9340b2ddf7e62f8ff6e5da2771ffb6751807bec9"

  url "https://github.com/Nanako0129/TokenBar/releases/download/v#{version}/TokenBar.app.tar.gz"
  name "TokenBar"
  desc "Menubar dashboard for local AI token usage"
  homepage "https://github.com/Nanako0129/TokenBar"

  deprecate! date: "2026-09-27", because: "has been renamed to Syrtis", replacement_cask: "nanako0129/tap/syrtis"

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "TokenBar.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/TokenBar.app"]
  end

  # A Sparkle update to Syrtis 2.x renames TokenBar.app to Syrtis.app, which
  # the app stanza above does not cover. Without this line, `brew uninstall
  # --cask tokenbar` reports success and leaves Syrtis.app behind (measured
  # 2026-09-25, Homebrew 6.0.22).
  uninstall delete: "#{appdir}/Syrtis.app"

  zap trash: [
    "~/Library/Application Support/com.nyanako.tokenbar",
    "~/Library/Caches/com.nyanako.tokenbar",
    "~/Library/Preferences/com.nyanako.tokenbar.beta.plist",
    "~/Library/Preferences/com.nyanako.tokenbar.plist",
  ]
end
