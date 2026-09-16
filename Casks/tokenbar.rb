cask "tokenbar" do
  version "1.18.0"
  sha256 "df3fe94627e57b1f7ce6236dd68f6638c4f814f5a19f65542df2983cc61b5895"

  url "https://github.com/Nanako0129/TokenBar/releases/download/v#{version}/TokenBar.app.tar.gz"
  name "TokenBar"
  desc "Menubar dashboard for local AI token usage"
  homepage "https://github.com/Nanako0129/TokenBar"

  auto_updates true
  depends_on macos: :sonoma
  depends_on arch: :arm64

  app "TokenBar.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/TokenBar.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.nyanako.tokenbar",
    "~/Library/Caches/com.nyanako.tokenbar",
    "~/Library/Preferences/com.nyanako.tokenbar.plist",
    "~/Library/Preferences/com.nyanako.tokenbar.beta.plist",
  ]
end
