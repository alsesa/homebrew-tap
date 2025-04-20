
cask 'ulanzi-deck' do
  version '1.7.2'
  sha256 'e69298782e8a45e335110021dfb6761437de1f95c375631db6e7ff2eb07c9f71'

  # 应用程序的下载 URL
  url 'https://cdn.ulanzistudio.com/UlanziDeck/1.7.2/Mac_Apple_UlanziDeck_V1.7.2_20250416.dmg'

  # 应用程序的名称
  name 'UlanziDeck'

  # 应用程序的描述
  desc 'A custom application for macOS'

  # 应用程序的开发者
  homepage 'https://ulanzistudio.com'

  # 安装到 Applications 目录
  app 'UlanziDeck.app'

  # 卸载时需要移除的文件和目录
  zap trash: [
    '~/Library/Preferences/com.ulanzistudio.UlanziDeck.plist',
    '~/Library/Saved\ Application\ State/ulanzi.UlanziDeck.savedState',
    '~/Library/Caches/UlanziDeck',
    '~/Library/Application Support/Ulanzi'
  ]
end
