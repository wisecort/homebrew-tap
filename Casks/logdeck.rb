cask "logdeck" do
  arch arm: "arm64", intel: "x64"

  version "1.2.1"
  sha256 arm:   "cdec0621d78c820d5079d7f787f441bc8d08c9941496c8e3efc1fa8c46177e2f",
         intel: "da0c93cecc69cd7c2de1e17001330c760192f7781a9c16a2dba4f28c736fa2ff"

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
