cask 'ima-copilot' do
  version '1.5.0'
  sha256 '3d4b72e1a219d130cf36f5dd255eaf135ad24d3838fad1f5cd1df6b0f3635b8b'

  # 应用程序的下载 URL
  url 'https://ima-app.image.myqcloud.com/app/ima.copilot_universal_1.5.0_2370.dmg'

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
