cask "tokenbar" do
  version "1.14.0"
  sha256 "b6acf77502029524872ae82700a5e474671929d0f968e294d739812dccd009a2"

  url "https://github.com/Nanako0129/TokenBar/releases/download/v#{version}/TokenBar.app.tar.gz"
  name "TokenBar"
  desc "Menubar dashboard for local AI token usage"
  homepage "https://github.com/Nanako0129/TokenBar"

  auto_updates true
  depends_on macos: :sonoma
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
    "~/Library/Preferences/com.nyanako.tokenbar.beta.plist",
  ]
end
