cask 'enjoy' do
  version '0.7.9'
  sha256 '4cd771d9408c3acab4ae6870cacb832470ee592fc46d5ccd608de989b312db56'

  # 应用程序的下载 URL
  url 'https://github.com/ZuodaoTech/everyone-can-use-english/releases/download/v0.7.9/Enjoy-0.7.9-arm64.dmg'

  # 应用程序的名称
  name 'Enjoy'

  # 应用程序的描述
  desc 'A custom application for macOS'

  # 应用程序的开发者
  homepage 'https://github.com/ZuodaoTech/everyone-can-use-english'

  # 安装到 Applications 目录
  app 'enjoy.app'

  # 卸载时需要移除的文件和目录
  zap trash: [
    '~/Library/Saved Application State/com.electron.enjoy.savedState/',
    '~/Library/Caches/Enjoy',
    '~/Library/Application Support/Enjoy'
  ]
end
