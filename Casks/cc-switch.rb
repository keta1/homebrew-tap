cask "cc-switch" do
  version "3.14.1"
  sha256 "97f48ae9e04ff24defa34cd787667b5e04922c9ecfd317323ac4b53035b01125"

  url "https://github.com/farion1231/cc-switch/releases/download/v#{version}/CC-Switch-v#{version}-macOS.dmg",
      verified: "github.com/farion1231/cc-switch"
  name "CC Switch"
  desc "A cross-platform desktop All-in-One assistant tool for Claude Code, Codex, OpenCode, openclaw & Gemini CLI."
  homepage "https://github.com/farion1231/cc-switch"

  app "CC Switch.app"

  uninstall quit: "com.ccswitch.desktop"

  zap trash: [
    "~/.cc-switch",
    "~/Library/Application Support/com.ccswitch.desktop",
    "~/Library/Caches/com.ccswitch.desktop",
    "~/Library/Logs/com.ccswitch.desktop",
    "~/Library/Preferences/com.ccswitch.desktop.plist",
    "~/Library/Saved Application State/com.ccswitch.desktop.savedState",
  ]

  livecheck do
    url :url
    strategy :github_latest
  end
end
