cask "tokenbar" do
  version "0.3.1"
  sha256 "231cfa24da6b99e5aa7b2b8e5cdbf1a45b4e4a09b050265c547760d0d84fceee"

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
