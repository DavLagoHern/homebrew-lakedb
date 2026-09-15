cask "lakedb" do
  version "1.0.0-beta.6.2.1"
  sha256 "4599af413496f76a6d0b5f81ea27654f330ff9f91f4ec10c626eb062f0e8e617"

  url "https://github.com/DavLagoHern/LakeDB/releases/download/v#{version}/LakeDB-#{version}-mac-arm64.dmg",
      verified: "github.com/DavLagoHern/LakeDB/"
  name "LakeDB"
  desc "Local-first, multi-database desktop client"
  homepage "https://github.com/DavLagoHern/LakeDB"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :monterey

  app "LakeDB.app"

  zap trash: [
    "~/Library/Application Support/LakeDB",
    "~/Library/Preferences/com.davidlago.lakedb.plist",
    "~/Library/Saved Application State/com.davidlago.lakedb.savedState",
  ]
end
