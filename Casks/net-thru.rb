cask "net-thru" do
  version "1.0.0"
  sha256 "39f7625325d507f06e5c438f9f98f55d28532cc4f7fd46f1bb72a9d93e8ad573"

  url "https://github.com/Loorik/net-thru/releases/download/v#{version}/net-thru-#{version}.zip"
  name "net-thru"
  desc "Menu bar monitor showing live upload and download speed"
  homepage "https://github.com/Loorik/net-thru"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "net-thru.app"

  uninstall quit: "com.lorikgashi.net-thru"

  zap trash: "~/Library/Preferences/com.lorikgashi.net-thru.plist"

  caveats <<~EOS
    net-thru is not notarized by Apple, so macOS blocks it the first time you open it.
    To allow it, open System Settings → Privacy & Security, scroll down and click
    "Open Anyway". You only need to do this once.
  EOS
end
