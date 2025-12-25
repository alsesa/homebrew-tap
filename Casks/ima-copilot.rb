cask 'ima-copilot' do
  version '2.0.3'
  sha256 '48f1c3c89b86d2beb29a0c25eb55f6a9de278dc582c569bc3e9e9a0eaf993c6f'

  # 应用程序的下载 URL
  url 'https://ima-app.image.myqcloud.com/mac_channel/ima.copilot_universal_10000074_2.0.3_3440.dmg'

  # 应用程序的名称
  name 'ima.copilot'

  # 应用程序的描述
  desc '会思考的知识库，开启搜读写新体验'

  # 应用程序的开发者
  homepage 'https://ima.qq.com'

  # 安装到 Applications 目录
  app 'ima.copilot.app'

  # 卸载时需要移除的文件和目录
  zap trash: [
    '~/Library/Saved Application State/com.tencent.imamac.savedState/',
    '~/Library/Caches/com.tencent.imamac/',
    '/Users/yuanhui/Library/Preferences/com.tencent.imamac.plist'
  ]
end
