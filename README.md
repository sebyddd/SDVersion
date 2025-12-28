# SDVersion

[![CI](https://github.com/sebyddd/SDVersion/actions/workflows/ci.yml/badge.svg)](https://github.com/sebyddd/SDVersion/actions/workflows/ci.yml)
[![CocoaPods](https://img.shields.io/cocoapods/v/SDVersion.svg)](https://cocoapods.org/pods/SDVersion)
[![SPM](https://img.shields.io/badge/SPM-compatible-brightgreen.svg)](https://swift.org/package-manager/)
[![Platform](https://img.shields.io/badge/platform-iOS%20%7C%20watchOS%20%7C%20tvOS%20%7C%20macOS-D0547F.svg)](https://github.com/sebyddd/SDVersion)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

Lightweight Cocoa library for detecting the running device's model and screen size.

SDVersion supports **iOS**, **iPadOS**, **watchOS**, **tvOS**, and **macOS** - including all devices from iPhone 4 through iPhone 16, Apple Watch through Series 10 and Ultra 2, Apple TV through 4K 3rd generation, and all Mac models including Apple Silicon (M1 through M4).

## Requirements

- iOS 13.0+ / macOS 11.0+ / watchOS 6.0+ / tvOS 13.0+
- Xcode 15.0+

## Installation

### Swift Package Manager (Recommended)

Add SDVersion to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/sebyddd/SDVersion.git", from: "5.0.0")
],
targets: [
    .target(name: "YourApp", dependencies: [
        .product(name: "SDiOSVersion", package: "SDVersion")  // or SDMacVersion, SDwatchOSVersion, SDtvOSVersion
    ])
]
```

Or in Xcode: File > Add Package Dependencies > Enter the repository URL, then select the appropriate library for your platform.

### CocoaPods

```ruby
pod 'SDVersion', '~> 5.0'
```

### Manual

Copy the `SDVersion` folder into your project.

## Usage

### iOS / iPadOS

```objective-c
#import "SDVersion.h"

// Check for device model
if ([SDVersion deviceVersion] == iPhone16Pro) {
    NSLog(@"You have an iPhone 16 Pro!");
} else if ([SDVersion deviceVersion] == iPadPro13InchM4) {
    NSLog(@"Nice iPad Pro with M4!");
}

// Check for device screen size
if ([SDVersion deviceSize] == Screen6Dot7inch) {
    NSLog(@"You have a 6.7 inch display");
}

// Check if screen is in zoom mode
if ([SDVersion isZoomed]) {
    NSLog(@"Device is in Zoom Mode");
}

// Get device name
NSLog(@"%@", [SDVersion deviceNameString]);
// e.g: "iPhone 16 Pro Max"

// Check iOS version
if ([SDVersion versionGreaterThanOrEqualTo:@"18"]) {
    NSLog(@"Running iOS 18 or later");
}
```

**Swift:**

```swift
import SDiOSVersion

// Check for device model
if SDiOSVersion.deviceVersion() == .iPhone16Pro {
    print("You have an iPhone 16 Pro!")
}

// Check for device screen size
if SDiOSVersion.deviceSize() == .Screen6Dot7inch {
    print("You have a 6.7 inch display")
}

// Get device name
print(SDiOSVersion.deviceNameString())
```

#### Supported iPhone Models

```
iPhone4, iPhone4S, iPhone5, iPhone5C, iPhone5S
iPhone6, iPhone6Plus, iPhone6S, iPhone6SPlus, iPhoneSE
iPhone7, iPhone7Plus, iPhone8, iPhone8Plus, iPhoneX
iPhoneXS, iPhoneXSMax, iPhoneXR
iPhone11, iPhone11Pro, iPhone11ProMax
iPhoneSE2, iPhone12Mini, iPhone12, iPhone12Pro, iPhone12ProMax
iPhone13Mini, iPhone13, iPhone13Pro, iPhone13ProMax
iPhoneSE3, iPhone14, iPhone14Plus, iPhone14Pro, iPhone14ProMax
iPhone15, iPhone15Plus, iPhone15Pro, iPhone15ProMax
iPhone16, iPhone16Plus, iPhone16Pro, iPhone16ProMax
iPhone16e
```

#### Supported iPad Models

```
iPad1 - iPad10, iPadMini - iPadMini7
iPadAir - iPadAir5, iPadAir11InchM2, iPadAir13InchM2
iPadPro9Dot7Inch, iPadPro10Dot5Inch, iPadPro11Inch - iPadPro11Inch4Gen
iPadPro12Dot9Inch - iPadPro12Dot9Inch6Gen
iPadPro11InchM4, iPadPro13InchM4
```

#### Supported Screen Sizes

```
Screen3Dot5inch, Screen4inch, Screen4Dot7inch
Screen5Dot4inch, Screen5Dot5inch, Screen5Dot8inch
Screen6Dot1inch, Screen6Dot3inch, Screen6Dot5inch
Screen6Dot7inch, Screen6Dot9inch
```

### watchOS

```objective-c
#import "SDwatchOSVersion.h"

if ([SDwatchOSVersion deviceVersion] == AppleWatch46mmSeries10) {
    NSLog(@"Apple Watch Series 10!");
}

if ([SDwatchOSVersion deviceSize] == Screen49mm) {
    NSLog(@"Apple Watch Ultra size");
}
```

#### Supported Watch Models

```
AppleWatch38mm, AppleWatch42mm (Original)
Series 1-3: 38mm/42mm variants
Series 4-6: 40mm/44mm variants
Series 7-9: 41mm/45mm variants
Series 10: 42mm/46mm variants
Apple Watch SE (1st & 2nd gen): 40mm/44mm
Apple Watch Ultra, Ultra 2: 49mm
```

### tvOS

```objective-c
#import "SDtvOSVersion.h"

if ([SDtvOSVersion deviceVersion] == AppleTV4K3rdGen) {
    NSLog(@"Apple TV 4K 3rd Generation");
}
```

#### Supported Apple TV Models

```
AppleTVHD (4th generation)
AppleTV4K1stGen, AppleTV4K2ndGen, AppleTV4K3rdGen
```

### macOS

```objective-c
#import "SDMacVersion.h"

// Check device type
if ([SDMacVersion deviceVersion] == DeviceVersionMacBookPro) {
    NSLog(@"MacBook Pro");
}

// Check for Apple Silicon
if ([SDMacVersion isAppleSilicon]) {
    NSLog(@"Running on Apple Silicon: %@", [SDMacVersion chipName]);
    // e.g: "Apple M4 Pro"
}

// Get chip type
if ([SDMacVersion chipType] == ChipTypeM4Max) {
    NSLog(@"M4 Max chip!");
}

// Check screen size
if ([SDMacVersion deviceSize] == Mac16Inch) {
    NSLog(@"16 inch display");
}

// Check for Retina
if ([SDMacVersion deviceScreenResolution] == DeviceScreenRetina) {
    NSLog(@"Retina display");
}
```

#### Supported Mac Models

```
DeviceVersionIMac, DeviceVersionMacMini, DeviceVersionMacPro
DeviceVersionMacBook, DeviceVersionMacBookAir, DeviceVersionMacBookPro
DeviceVersionMacStudio, DeviceVersionXserve
```

#### Supported Chip Types

```
ChipTypeIntel
ChipTypeM1, ChipTypeM1Pro, ChipTypeM1Max, ChipTypeM1Ultra
ChipTypeM2, ChipTypeM2Pro, ChipTypeM2Max, ChipTypeM2Ultra
ChipTypeM3, ChipTypeM3Pro, ChipTypeM3Max
ChipTypeM4, ChipTypeM4Pro, ChipTypeM4Max
```

#### Supported Screen Sizes

```
Mac11Inch, Mac12Inch, Mac13Inch, Mac14Inch
Mac15Inch, Mac16Inch, Mac17Inch
Mac20Inch, Mac21Dot5Inch, Mac24Inch, Mac27Inch
```

## API Reference

### Common Methods (All Platforms)

```objective-c
+ (DeviceVersion)deviceVersion;
+ (BOOL)versionEqualTo:(NSString *)version;
+ (BOOL)versionGreaterThan:(NSString *)version;
+ (BOOL)versionGreaterThanOrEqualTo:(NSString *)version;
+ (BOOL)versionLessThan:(NSString *)version;
+ (BOOL)versionLessThanOrEqualTo:(NSString *)version;
```

### iOS Specific

```objective-c
+ (NSString *)deviceNameForVersion:(DeviceVersion)deviceVersion;
+ (DeviceSize)resolutionSize;
+ (DeviceSize)deviceSize;
+ (NSString *)deviceSizeName:(DeviceSize)deviceSize;
+ (NSString *)deviceNameString;
+ (BOOL)isZoomed;
```

### macOS Specific

```objective-c
+ (NSString *)deviceVersionString;
+ (DeviceSize)deviceSize;
+ (NSString *)deviceSizeName:(DeviceSize)deviceSize;
+ (NSSize)deviceScreenResolutionPixelSize;
+ (DeviceScreenResolution)deviceScreenResolution;
+ (NSString *)deviceScreenResolutionName:(DeviceScreenResolution)resolution;
+ (BOOL)isAppleSilicon;
+ (ChipType)chipType;
+ (NSString *)chipName;
```

## Privacy

SDVersion includes a Privacy Manifest (`PrivacyInfo.xcprivacy`) for App Store compliance. The library uses the `utsname` system call to detect device models, which does not require privacy declarations.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines on adding support for new devices.

## License

SDVersion is available under the MIT license. See the [LICENSE](LICENSE) file for more info.
