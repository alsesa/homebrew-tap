cask "betterdummy" do
  version "1.1.24"
  sha256 "5d02657f3aa77017f5a94af16d042cef011094b58f19b4d0f4a79e090311cfb3"

  url "https://jihulab.com/1024town/china-speed/-/package_files/1431/download"
  name "betterdummy"
  desc "Dummy Display for Apple Silicon Macs to achieve custom resolutions"
  homepage "https://github.com/waydabber/BetterDummy"

  auto_updates true

  app "BetterDummy.app"

  zap trash: [
    "~/Library/Application Scripts/me.waydabber.BetterDummyHelper",
    "~/Library/Application Scripts/me.waydabber.BetterDummy",
    "~/Library/Containers/me.waydabber.BetterDummyHelper",
    "~/Library/Containers/me.waydabber.BetterDummy",
    "~/Library/Preferences/me.waydabber.BetterDummy.plist",
  ]

  # 修复后的 caveats 部分
  caveats <<~EOS
    #{token} has been renamed 'betterdisplay',
    install betterdisplay to continue receiving updates;

      brew install --cask betterdisplay
  EOS
end
