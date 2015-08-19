Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = "SDVersion"
  s.version      = "1.0.0"
  s.summary      = "Objective-C library for detecting running device model and screen size."
  s.homepage     = "https://github.com/sebyddd/SDVersion"
  s.screenshots  = "https://dl.dropboxusercontent.com/s/5ddx58dsex25x57/sdversion-logo.png?dl=0"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Licensing your code is important. See http://choosealicense.com for more info.
  #  CocoaPods will detect a license file if there is a named LICENSE*
  #  Popular ones are 'MIT', 'BSD' and 'Apache License, Version 2.0'.
  #

  s.license      = "MIT (example)"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Sebastian Dobrincu" => "sebyddd@gmail.com" }
  s.platform     = :ios, "5.0"
  s.source       = { 
  :git => "https://github.com/sebyddd/SDVersion.git", 
  :tag => "1.1.2" }

  s.source_files  = "SDVersion/*.{h,m}"

  s.requires_arc = true

end

