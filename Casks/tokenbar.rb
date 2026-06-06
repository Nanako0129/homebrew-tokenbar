cask "tokenbar" do
  version "0.3.3"
  sha256 "80d8acb881c7f09fc596f6df76264886dbb170667f0bc7f04da0051658a9397b"

  url "https://github.com/Nanako0129/TokenBar/releases/download/v#{version}/TokenBar_#{version}_aarch64.dmg"
  name "TokenBar"
  desc "Menubar dashboard for local AI token usage"
  homepage "https://github.com/Nanako0129/TokenBar"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :big_sur"
  depends_on arch: :arm64

  app "TokenBar.app"

  zap trash: [
    "~/Library/Application Support/com.nyanako.tokenbar",
    "~/Library/Caches/com.nyanako.tokenbar",
    "~/Library/Preferences/com.nyanako.tokenbar.plist",
    "~/Library/Saved Application State/com.nyanako.tokenbar.savedState",
  ]
end
