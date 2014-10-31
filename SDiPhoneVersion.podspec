Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = "SDiPhoneVersion"
  s.version      = "1.1.1"
  s.summary      = "Objective-C library for detecting running device model and screen size."
  s.homepage     = "https://github.com/sebyddd/SDiPhoneVersion"
  s.screenshots  = "https://dl.dropboxusercontent.com/s/z8d85uw2drs9lpm/sdiphoneversion.png"


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
  :git => "https://github.com/sebyddd/SDiPhoneVersion.git", 
  :tag => "1.1.1" }

  s.source_files  = "SDiPhoneVersion/*.{h,m}"

  s.requires_arc = true

end

