cask "logdeck" do
  arch arm: "arm64", intel: "x64"

  version "1.2.0"
  sha256 arm:   "b20a626a39fabdae2d0a530bb6c391277c170aa412abb45ab30685eff417726d",
         intel: "8ec48b181853572f97a30bc09a89a5ab4bd33259221802712ef3579bfd35efd8"

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
