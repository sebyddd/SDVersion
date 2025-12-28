# Changelog

All notable changes to SDVersion will be documented in this file.

## [5.0.0] - 2025-01-01

### Breaking Changes
- **Minimum deployment targets updated:**
  - iOS: 7.0 -> 13.0
  - macOS: 10.9 -> 11.0
  - watchOS: 2.0 -> 6.0
  - tvOS: 9.0 -> 13.0
- Device enum values have been reorganized with new integer assignments
- Some legacy device enum names have been updated for consistency

### Added

#### iOS Devices
- iPhone XS, XS Max, XR (2018)
- iPhone 11, 11 Pro, 11 Pro Max (2019)
- iPhone SE (2nd generation), iPhone 12 mini/12/12 Pro/12 Pro Max (2020)
- iPhone 13 mini/13/13 Pro/13 Pro Max (2021)
- iPhone SE (3rd generation), iPhone 14/14 Plus/14 Pro/14 Pro Max (2022)
- iPhone 15/15 Plus/15 Pro/15 Pro Max (2023)
- iPhone 16/16 Plus/16 Pro/16 Pro Max (2024)
- iPhone 16e (2025)

#### iPad Devices
- iPad (6th-10th generation)
- iPad Pro 11-inch (1st-4th generation)
- iPad Pro 12.9-inch (3rd-6th generation)
- iPad Pro 11-inch M4, iPad Pro 13-inch M4 (2024)
- iPad Air (3rd-5th generation)
- iPad Air 11-inch M2, iPad Air 13-inch M2 (2024)
- iPad mini (5th-7th generation)

#### iPod Devices
- iPod touch (7th generation)

#### Apple Watch Models
- Apple Watch Series 4, 5, 6, 7, 8, 9, 10
- Apple Watch SE (1st and 2nd generation)
- Apple Watch Ultra, Ultra 2
- New screen sizes: 40mm, 41mm, 44mm, 45mm, 46mm, 49mm

#### Apple TV Models
- Apple TV 4K (2nd generation)
- Apple TV 4K (3rd generation)

#### Mac Models
- Mac Studio (M1 Max, M1 Ultra, M2 Max, M2 Ultra)
- Mac Pro (M2 Ultra)
- iMac 24-inch (M1, M3, M4)
- Mac mini (M1, M2, M2 Pro, M4, M4 Pro)
- MacBook Air (M1, M2, M3)
- MacBook Pro 13-inch (M1, M2)
- MacBook Pro 14-inch (M1 Pro/Max, M2 Pro/Max, M3/Pro/Max, M4/Pro/Max)
- MacBook Pro 16-inch (M1 Pro/Max, M2 Pro/Max, M3 Pro/Max, M4 Pro/Max)

#### New Screen Sizes
- iPhone: 5.4", 6.1", 6.3", 6.5", 6.7", 6.9"
- Apple Watch: 40mm, 41mm, 44mm, 45mm, 46mm, 49mm
- Mac: 14", 16"

#### New macOS Features
- `isAppleSilicon` - Check if running on Apple Silicon
- `chipType` - Get the specific chip (M1, M1 Pro, M2, etc.)
- `chipName` - Get human-readable chip name
- `DeviceVersionMacStudio` - New device type for Mac Studio
- `ChipType` enum for all Apple Silicon variants

### Infrastructure
- Added Swift Package Manager support (`Package.swift`)
- Added Privacy Manifest (`PrivacyInfo.xcprivacy`) for App Store compliance
- Added GitHub Actions CI/CD workflow
- Updated `.gitignore` for modern Xcode and SPM
- Added `CONTRIBUTING.md` with guidelines for adding new devices

### Fixed
- Apple Silicon simulator detection (arm64)
- Screen size detection for notched and Dynamic Island iPhones

## [4.3.2] - Previous Release
- Last release before 5.0.0 modernization
