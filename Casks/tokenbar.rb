cask "tokenbar" do
  version "1.1.1"
  sha256 "e678e01d1bf4ebb4cb6e95f15da03ac7206e760110f16cb7ce7c2acf817a539b"

  url "https://github.com/Nanako0129/TokenBar/releases/download/v#{version}/TokenBar.app.tar.gz"
  name "TokenBar"
  desc "Menubar dashboard for local AI token usage"
  homepage "https://github.com/Nanako0129/TokenBar"

  auto_updates true
  depends_on macos: ">= :sonoma"
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
