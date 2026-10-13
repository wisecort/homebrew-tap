cask "logdeck" do
  arch arm: "arm64", intel: "x64"

  version "1.4.0"
  sha256 arm:   "a52909604d1ad715251e56d0d278262346256fd4cb012a9fbfd985e756824826",
         intel: "48d37b3894261f0caa66bbbfeba8018b8359a38edfdae7bc32a542c80df7b521"

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
