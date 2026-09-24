cask "tokenbar" do
  version "1.20.2"
  sha256 "5467d5149efd54a746022c6e9340b2ddf7e62f8ff6e5da2771ffb6751807bec9"

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
