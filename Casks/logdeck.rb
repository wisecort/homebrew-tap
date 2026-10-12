cask "logdeck" do
  arch arm: "arm64", intel: "x64"

  version "1.3.0"
  sha256 arm:   "0d06a5936ca0f373f2df717ef1503bad74e90487d89467054e87c0815efd4a09",
         intel: "b7cd3e26bbeb2b28d46a2c8d362854fd6a879b2cd25b7d566e367cf0891929cf"

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
