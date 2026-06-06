cask "tokenbar" do
  version "0.3.0"
  sha256 "8d9988fce025294c79a74cd1ca93d5b9e8309f84ddf3f7b7a23c5c69ee9d22e8"

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
