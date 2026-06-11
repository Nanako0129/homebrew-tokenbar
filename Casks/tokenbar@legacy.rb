cask "tokenbar@legacy" do
  version "0.4.5"
  sha256 "8bcfcee077b5419ce79d73636fa3b2654671b6a7cb2672bd1ac2f3e0a4b782b7"

  url "https://github.com/Nanako0129/TokenBar-Tauri/releases/download/v#{version}/TokenBar.app.tar.gz"
  name "TokenBar Legacy"
  desc "Menubar dashboard for local AI token usage (final Tauri build)"
  homepage "https://github.com/Nanako0129/TokenBar-Tauri"

  conflicts_with cask: "tokenbar"
  depends_on macos: :big_sur
  depends_on arch: :arm64

  app "TokenBar.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/TokenBar.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.nyanako.tokenbar",
    "~/Library/Caches/com.nyanako.tokenbar",
    "~/Library/Preferences/com.nyanako.tokenbar.plist",
    "~/Library/Saved Application State/com.nyanako.tokenbar.savedState",
  ]

  caveats <<~EOS
    This is the final Tauri-based TokenBar, kept for macOS 11–13.
    On macOS 14+ install the actively developed native app instead:
      brew install --cask nanako0129/tokenbar/tokenbar
  EOS
end
