cask "passage" do
  version "0.1.0"
  sha256 "541b309c10c00d17c13e724c7f6907e5ff8a86ace4845cb8261496df6d83dec1"

  url "https://github.com/neomis/passage/releases/download/v#{version}/Passage-#{version}-arm64.zip"
  name "Passage"
  desc "Menu bar client for L2TP/IPsec VPNs with configurable IPsec algorithms"
  homepage "https://github.com/neomis/passage"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Passage.app"

  uninstall quit:   "io.github.neomis.passage",
            script: {
              executable: "#{appdir}/Passage.app/Contents/Resources/uninstall-helper.sh",
              sudo:       true,
            }

  zap trash: [
    "~/Library/Application Support/Passage",
    "~/Library/Preferences/io.github.neomis.passage.plist",
  ]

  caveats <<~EOS
    Passage isn't notarized by Apple yet. If macOS blocks the first launch, open
    System Settings > Privacy & Security and click "Open Anyway".
  EOS
end
