cask "64gram" do
  version "1.2.1"
  sha256 "5bc6df26c617bdefe135616a23ae869ca44ce774b6ce65e7a570c02f0a49df2d"

  url "https://github.com/TDesktop-x64/tdesktop/releases/download/v#{version}/64Gram_#{version}_mac.dmg",
      verified: "github.com/TDesktop-x64/tdesktop/"
  name "64Gram"
  desc "Unofficial Telegram Desktop client"
  homepage "https://github.com/TDesktop-x64/tdesktop"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  app "Telegram.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Telegram.app"]
  end

  uninstall quit: "com.tdesktop.Telegram"

  zap trash: [
    "~/Library/Application Support/Telegram Desktop",
    "~/Library/Preferences/com.tdesktop.Telegram.plist",
    "~/Library/Saved Application State/com.tdesktop.Telegram.savedState",
  ]
end
