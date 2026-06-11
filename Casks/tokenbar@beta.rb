cask "tokenbar@beta" do
  version "1.0.0-beta.3"
  sha256 "1226facf15c382d4fe53dfd6b15a32ccf19b39b6cbfb79e984b59efef5c9c211"

  url "https://github.com/Nanako0129/TokenBar-Native/releases/download/v#{version}/TokenBar-Beta.app.tar.gz"
  name "TokenBar Beta"
  desc "Menubar dashboard for local AI token usage (native beta)"
  homepage "https://github.com/Nanako0129/TokenBar-Native"

  auto_updates true
  depends_on macos: ">= :sonoma"
  depends_on arch: :arm64

  app "TokenBar Beta.app"

  postflight do
    system_command "/usr/bin/xattr",
      args: ["-dr", "com.apple.quarantine", "#{appdir}/TokenBar Beta.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.nyanako.tokenbar.beta",
    "~/Library/Caches/com.nyanako.tokenbar.beta",
    "~/Library/Preferences/com.nyanako.tokenbar.beta.plist",
  ]
end
