//
//  SDiOSVersion.h
//  SDVersion
//
//  Copyright (c) 2016-2025 Sebastian Dobrincu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, DeviceVersion){
    UnknownDevice         = 0,
    Simulator             = 1,

    // iPhones (Legacy - pre-2018)
    iPhone4               = 3,
    iPhone4S              = 4,
    iPhone5               = 5,
    iPhone5C              = 6,
    iPhone5S              = 7,
    iPhone6               = 8,
    iPhone6Plus           = 9,
    iPhone6S              = 10,
    iPhone6SPlus          = 11,
    iPhone7               = 12,
    iPhone7Plus           = 13,
    iPhone8               = 14,
    iPhone8Plus           = 15,
    iPhoneX               = 16,
    iPhoneSE              = 17,

    // iPhones (2018)
    iPhoneXS              = 40,
    iPhoneXSMax           = 41,
    iPhoneXR              = 42,

    // iPhones (2019)
    iPhone11              = 43,
    iPhone11Pro           = 44,
    iPhone11ProMax        = 45,

    // iPhones (2020)
    iPhoneSE2             = 46,
    iPhone12Mini          = 47,
    iPhone12              = 48,
    iPhone12Pro           = 49,
    iPhone12ProMax        = 50,

    // iPhones (2021)
    iPhone13Mini          = 51,
    iPhone13              = 52,
    iPhone13Pro           = 53,
    iPhone13ProMax        = 54,

    // iPhones (2022)
    iPhoneSE3             = 55,
    iPhone14              = 56,
    iPhone14Plus          = 57,
    iPhone14Pro           = 58,
    iPhone14ProMax        = 59,

    // iPhones (2023)
    iPhone15              = 60,
    iPhone15Plus          = 61,
    iPhone15Pro           = 62,
    iPhone15ProMax        = 63,

    // iPhones (2024)
    iPhone16              = 64,
    iPhone16Plus          = 65,
    iPhone16Pro           = 66,
    iPhone16ProMax        = 67,

    // iPhones (2025)
    iPhone16e             = 68,

    // iPads (Legacy - pre-2018)
    iPad1                 = 100,
    iPad2                 = 101,
    iPadMini              = 102,
    iPad3                 = 103,
    iPad4                 = 104,
    iPadAir               = 105,
    iPadMini2             = 106,
    iPadAir2              = 107,
    iPadMini3             = 108,
    iPadMini4             = 109,
    iPadPro12Dot9Inch     = 110,
    iPadPro9Dot7Inch      = 111,
    iPad5                 = 112,
    iPadPro12Dot9Inch2Gen = 113,
    iPadPro10Dot5Inch     = 114,

    // iPads (2018)
    iPad6                 = 115,
    iPadPro11Inch         = 116,
    iPadPro12Dot9Inch3Gen = 117,

    // iPads (2019)
    iPad7                 = 118,
    iPadMini5             = 119,
    iPadAir3              = 120,

    // iPads (2020)
    iPad8                 = 121,
    iPadPro11Inch2Gen     = 122,
    iPadPro12Dot9Inch4Gen = 123,
    iPadAir4              = 124,

    // iPads (2021)
    iPad9                 = 125,
    iPadMini6             = 126,
    iPadPro11Inch3Gen     = 127,
    iPadPro12Dot9Inch5Gen = 128,

    // iPads (2022)
    iPad10                = 129,
    iPadPro11Inch4Gen     = 130,
    iPadPro12Dot9Inch6Gen = 131,
    iPadAir5              = 132,

    // iPads (2024)
    iPadPro11InchM4       = 133,
    iPadPro13InchM4       = 134,
    iPadAir11InchM2       = 135,
    iPadAir13InchM2       = 136,
    iPadMini7             = 137,

    // iPods
    iPodTouch1Gen         = 200,
    iPodTouch2Gen         = 201,
    iPodTouch3Gen         = 202,
    iPodTouch4Gen         = 203,
    iPodTouch5Gen         = 204,
    iPodTouch6Gen         = 205,
    iPodTouch7Gen         = 206
};

typedef NS_ENUM(NSInteger, DeviceSize){
    UnknownSize     = 0,
    Screen3Dot5inch = 1,
    Screen4inch     = 2,
    Screen4Dot7inch = 3,
    Screen5Dot4inch = 4,
    Screen5Dot5inch = 5,
    Screen5Dot8inch = 6,
    Screen6Dot1inch = 7,
    Screen6Dot3inch = 8,
    Screen6Dot5inch = 9,
    Screen6Dot7inch = 10,
    Screen6Dot9inch = 11
};

@interface SDiOSVersion : NSObject

+ (DeviceVersion)deviceVersion;
+ (NSString *)deviceNameForVersion:(DeviceVersion)deviceVersion;
+ (DeviceSize)resolutionSize;
+ (DeviceSize)deviceSize;
+ (NSString *)deviceSizeName:(DeviceSize)deviceSize;
+ (NSString *)deviceNameString;
+ (BOOL)isZoomed;

+ (BOOL)versionEqualTo:(NSString *)version;
+ (BOOL)versionGreaterThan:(NSString *)version;
+ (BOOL)versionGreaterThanOrEqualTo:(NSString *)version;
+ (BOOL)versionLessThan:(NSString *)version;
+ (BOOL)versionLessThanOrEqualTo:(NSString *)version;

@end
