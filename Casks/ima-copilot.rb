cask 'ima-copilot' do
  version '1.9.3'
  sha256 '1169ae8407087ceb242e9972e7616627cf80bfbf28eb9acad4156513cd997191'

  # 应用程序的下载 URL
  url 'https://ima-app.image.myqcloud.com/mac_channel/ima.copilot_universal_10000074_1.9.3_2980.dmg'

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
