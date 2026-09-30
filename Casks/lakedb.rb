cask "lakedb" do
  version "1.0.0-beta.7.1"
  sha256 "e0f740707003cf1814dc84e85b12491912ed97af2d7aec66e7023f5a221e753e"

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
