Pod::Spec.new do |s|
  s.name         = "SDVersion"
  s.version      = "5.0.0"
  s.summary      = "Lightweight Cocoa library for detecting the running device's model and screen size."
  s.description  = <<-DESC
    SDVersion is a lightweight Cocoa library for detecting the running device's model,
    screen size, and OS version. It supports iOS, iPadOS, watchOS, tvOS, and macOS,
    including all devices from iPhone 4 through iPhone 16, iPad through iPad Pro M4,
    Apple Watch through Series 10 and Ultra 2, Apple TV through 4K 3rd generation,
    and all Mac models including Apple Silicon (M1 through M4).
  DESC
  s.homepage     = "https://github.com/sebyddd/SDVersion"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Sebastian Dobrincu" => "me@dobrincu.co" }

  s.ios.deployment_target = '13.0'
  s.osx.deployment_target = '11.0'
  s.watchos.deployment_target = '6.0'
  s.tvos.deployment_target = '13.0'

  s.source       = { :git => 'https://github.com/sebyddd/SDVersion.git', :tag => "#{s.version}" }
  s.source_files = "SDVersion/*.{h,m}"

  s.ios.source_files = "SDVersion/SDiOSVersion/*.{h,m}"
  s.osx.source_files = "SDVersion/SDMacVersion/*.{h,m}"
  s.watchos.source_files = "SDVersion/SDwatchOSVersion/*.{h,m}"
  s.tvos.source_files = "SDVersion/SDtvOSVersion/*.{h,m}"

  s.resource_bundles = {
    'SDVersion_Privacy' => ['SDVersion/PrivacyInfo.xcprivacy']
  }

  s.requires_arc = true
  s.swift_versions = ['5.0']
end
