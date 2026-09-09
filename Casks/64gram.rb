cask "64gram" do
  version "1.2.8"
  sha256 "4fe036a5820295b411305edd3b4d9b92c92d80dbc3da5a57471aac4b2ed0f74f"

  url "https://github.com/TDesktop-x64/tdesktop/releases/download/v#{version}/64Gram_#{version}_mac.dmg"
  name "64Gram"
  desc "Unofficial Telegram Desktop client"
  homepage "https://github.com/TDesktop-x64/tdesktop"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on :macos

  app "Telegram.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/Telegram.app"]
  end

  uninstall quit: "com.tdesktop.Telegram"

  zap trash: [
    "~/Library/Application Support/Telegram Desktop",
    "~/Library/Preferences/com.tdesktop.Telegram.plist",
    "~/Library/Saved Application State/com.tdesktop.Telegram.savedState",
  ]
end
