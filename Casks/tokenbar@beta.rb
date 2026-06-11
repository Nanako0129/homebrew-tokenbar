cask "tokenbar@beta" do
  version "1.0.0-beta.1"
  sha256 "76c0c7ceaf67b6155dc1eec9b5f3e97c97e6cb388d34c23efa59ab4f419632e6"

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
