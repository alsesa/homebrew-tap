cask 'ugeetablet' do
    version '4.3.5.241012'
    # 这里需要替换为你实际下载的 zip 文件的 SHA - 256 校验和
    sha256 'ead984d7f7c7c13f956cdc59d4b794ffb2b5ea2ebe9925723223c70dc86294fd'
    # 替换为实际的 zip 文件下载链接
    url 'https://download.ugee.com.cn/upload/download/20241021/ugee_Mac_4.3.5.241012.zip'
  
    name 'ugee Digitizer Driver'
    desc 'Driver for a ugee Q8W digitizer tablet'
    homepage 'https://www.ugee.com.cn/'
  
    # 使用 installer 块处理 pkg 安装
    installer script: {
        executable: '/usr/sbin/installer',
        args:       ['-pkg', "#{staged_path}/UGEEMac_4.3.5.241012.pkg", '-target', '/'],
        sudo:       true
    }
  
    # 卸载部分
    uninstall pkgutil: 'com.ugee.digitizer.driver',
              delete:  [
                '/Library/Application Support/DigitizerDriver',
                '/Library/LaunchDaemons/com.ugee.digitizer.driver.plist'
              ]
  
    # 清理部分
    zap trash: [
      '~/Library/Preferences/com.ugee.digitizer.driver.plist',
      '~/Library/Caches/com.ugee.digitizer.driver'
    ]
  end