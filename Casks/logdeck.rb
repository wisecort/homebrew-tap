cask "logdeck" do
  arch arm: "arm64", intel: "x64"

  version "1.1.0"
  sha256 arm:   "e4b2d045b848774c515ed662a43adee80b8190cacae02b0b1c0515a5279e2c83",
         intel: "e6a5e9f6b330f7d4504575dea9a12d62336ed07b6d178559af9f03a82e51ad29"

  url "https://github.com/wisecort/LogDeck/releases/download/v#{version}/LogDeck-#{version}-#{arch}.dmg"
  name "LogDeck"
  desc "Read-only Kubernetes/OKD log explorer"
  homepage "https://github.com/wisecort/LogDeck"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on formula: "kubernetes-cli"
  depends_on macos: :ventura

  app "LogDeck.app"

  zap trash: [
    "~/Library/Application Support/LogDeck",
    "~/Library/Logs/LogDeck",
    "~/Library/Preferences/io.github.wisecort.logdeck.plist",
    "~/Library/Saved Application State/io.github.wisecort.logdeck.savedState",
  ]

  caveats <<~EOS
    LogDeck is not notarized by Apple yet. If macOS blocks the first launch, run:
      xattr -dr com.apple.quarantine #{appdir}/LogDeck.app
  EOS
end
