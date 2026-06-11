cask "tokenbar@beta" do
  version "1.0.0-beta.2"
  sha256 "1fc050420504c2af265e98a891e8ed403386cafa70368e4f1848aa697b293254"

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
