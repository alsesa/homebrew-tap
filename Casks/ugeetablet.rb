cask 'ugeetablet' do
    version '4.3.5.250213'
    # 这里需要替换为你实际下载的 zip 文件的 SHA - 256 校验和
    sha256 'bb1c0961a55a1d706ea2b8b8c542ec9c3eb0f21f11ab68c6fe96edfdc19bd787'
    # 替换为实际的 zip 文件下载链接
    url 'https://ugeecom-download.oss-us-west-1.aliyuncs.com/file/2025/03/ugee_Mac_4.3.5.250213.zip'  

    name 'ugee Digitizer Driver'
    desc 'Driver for a ugee Q8W digitizer tablet'
    homepage 'https://www.ugee.com/'
  
    # 使用 installer 块处理 pkg 安装
    installer script: {
        executable: '/usr/sbin/installer',
        args:       ['-pkg', "#{staged_path}/UGEEMac_4.3.5.250213.pkg", '-target', '/'],
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
