Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = "SDVersion"
  s.version      = "4.3.2"
  s.summary      = "Lightweight Cocoa library for detecting the running device's model and screen size."
  s.homepage     = "https://github.com/sebyddd/SDVersion"
  s.screenshots  = "https://dl.dropboxusercontent.com/s/bmfjwfe2ngnivwn/sdversion.png?dl=0"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Licensing your code is important. See http://choosealicense.com for more info.
  #  CocoaPods will detect a license file if there is a named LICENSE*
  #  Popular ones are 'MIT', 'BSD' and 'Apache License, Version 2.0'.
  #

  s.license      = "MIT (example)"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Sebastian Dobrincu" => "me@dobrincu.co" }
  s.platform     = :ios
  s.platform     = :osx
  s.platform     = :watchos
  s.platform     = :tvos
  s.ios.deployment_target = '7.0'
  s.osx.deployment_target = '10.9'
  s.watchos.deployment_target = '2.0'
  s.tvos.deployment_target = '9.0'
  s.ios.source_files = "SDVersion/SDiOSVersion/*.{h,m}"
  s.osx.source_files = "SDVersion/SDMacVersion/*.{h,m}"
  s.watchos.source_files = "SDVersion/SDwatchOSVersion/*.{h,m}"
  s.tvos.source_files = "SDVersion/SDtvOSVersion/*.{h,m}"
  s.source       = { :git => 'https://github.com/sebyddd/SDVersion.git', :tag => "#{s.version}" }
  s.source_files  = "SDVersion/*.{h,m}"

  s.requires_arc = true

end
