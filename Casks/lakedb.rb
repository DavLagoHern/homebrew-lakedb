cask "lakedb" do
  version "1.0.0-beta.5.2.3"
  sha256 "ecb89551b9848439977f05257b17a2b152a96d38615693a8d77348038dcfa155"

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
