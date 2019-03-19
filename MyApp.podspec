
Pod::Spec.new do |s|

  s.name         = "MyApp" # 项目名称

  s.version      = "0.0.1"        # 版本号 与 你仓库的 标签号 对应

  s.license      = "MIT"          # 开源证书

  s.summary      = "MyApp" # 项目简介

  s.homepage     = "[https://github.com/NEOLYH/MyApp.git](https://github.com/NEOLYH/MyApp.git)" # 你的主页

  s.source       = { :git => "https://github.com/NEOLYH/MyApp.git", :tag => "0.0.1" }#你的仓库地址，不能用SSH地址

  s.source_files = "MyApp/Classes/**/*" # "Classes/*.{h,m,swift}" # 你代码的位置， Classes/*.{h,m} 表示 Classes 文件夹下所有的.h和.m文件

  #资源文件地址

  s.resource = 'MyApp/Source.bundle'

  s.requires_arc = true # 是否启用ARCS

  s.platform     = :ios, "9.0" #平台及支持的最低版本
  s.ios.deployment_target = '9.0'

  s.frameworks   = "UIKit", "Foundation" #支持的框架

  s.author             = { "Faith" => "895928691@qq.com" }

 # s.social_media_url   = "[https://github.com/NEOLYH](https://github.com/NEOLYH)" # 个人主页

end
