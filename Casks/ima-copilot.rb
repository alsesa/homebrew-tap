cask 'ima-copilot' do
  version '2.0.1'
  sha256 'bbcd99ebc805e5a05a8d707feb9080224c7b61b6f78afee2cf6b66e62e06a6c1'

  # 应用程序的下载 URL
  url 'https://ima-app.image.myqcloud.com/mac_channel/ima.copilot_universal_10000074_2.0.1_3375.dmg'

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
