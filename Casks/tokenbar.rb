cask "tokenbar" do
  version "1.14.3"
  sha256 "f3619d58fd00a5bba6b68d693ddfbcb7cf4edae41e5f1699a5741f4c03790d31"

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
