cask "lakedb" do
  version "1.0.0-beta.7.3"
  sha256 "1cc83b9e14c60375f8e67d99df14bb5e51a8f75cdae263f548a9ff0775cde8f4"

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
