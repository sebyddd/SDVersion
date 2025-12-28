//
//  SDiOSVersion.m
//  SDVersion
//
//  Copyright (c) 2016-2025 Sebastian Dobrincu. All rights reserved.
//

#import "SDiOSVersion.h"
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>
#import <sys/utsname.h>

@implementation SDiOSVersion

+ (NSDictionary*)deviceNamesByCode
{
    static NSDictionary *deviceNamesByCode = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        deviceNamesByCode = @{
            // Simulators
            @"i386"       : @(Simulator),
            @"x86_64"     : @(Simulator),
            @"arm64"      : @(Simulator),

            // iPhones (Legacy)
            @"iPhone3,1"  : @(iPhone4),
            @"iPhone3,2"  : @(iPhone4),
            @"iPhone3,3"  : @(iPhone4),
            @"iPhone4,1"  : @(iPhone4S),
            @"iPhone5,1"  : @(iPhone5),
            @"iPhone5,2"  : @(iPhone5),
            @"iPhone5,3"  : @(iPhone5C),
            @"iPhone5,4"  : @(iPhone5C),
            @"iPhone6,1"  : @(iPhone5S),
            @"iPhone6,2"  : @(iPhone5S),
            @"iPhone7,2"  : @(iPhone6),
            @"iPhone7,1"  : @(iPhone6Plus),
            @"iPhone8,1"  : @(iPhone6S),
            @"iPhone8,2"  : @(iPhone6SPlus),
            @"iPhone8,4"  : @(iPhoneSE),
            @"iPhone9,1"  : @(iPhone7),
            @"iPhone9,3"  : @(iPhone7),
            @"iPhone9,2"  : @(iPhone7Plus),
            @"iPhone9,4"  : @(iPhone7Plus),
            @"iPhone10,1" : @(iPhone8),
            @"iPhone10,4" : @(iPhone8),
            @"iPhone10,2" : @(iPhone8Plus),
            @"iPhone10,5" : @(iPhone8Plus),
            @"iPhone10,3" : @(iPhoneX),
            @"iPhone10,6" : @(iPhoneX),

            // iPhones (2018)
            @"iPhone11,2" : @(iPhoneXS),
            @"iPhone11,4" : @(iPhoneXSMax),
            @"iPhone11,6" : @(iPhoneXSMax),
            @"iPhone11,8" : @(iPhoneXR),

            // iPhones (2019)
            @"iPhone12,1" : @(iPhone11),
            @"iPhone12,3" : @(iPhone11Pro),
            @"iPhone12,5" : @(iPhone11ProMax),

            // iPhones (2020)
            @"iPhone12,8" : @(iPhoneSE2),
            @"iPhone13,1" : @(iPhone12Mini),
            @"iPhone13,2" : @(iPhone12),
            @"iPhone13,3" : @(iPhone12Pro),
            @"iPhone13,4" : @(iPhone12ProMax),

            // iPhones (2021)
            @"iPhone14,4" : @(iPhone13Mini),
            @"iPhone14,5" : @(iPhone13),
            @"iPhone14,2" : @(iPhone13Pro),
            @"iPhone14,3" : @(iPhone13ProMax),

            // iPhones (2022)
            @"iPhone14,6" : @(iPhoneSE3),
            @"iPhone14,7" : @(iPhone14),
            @"iPhone14,8" : @(iPhone14Plus),
            @"iPhone15,2" : @(iPhone14Pro),
            @"iPhone15,3" : @(iPhone14ProMax),

            // iPhones (2023)
            @"iPhone15,4" : @(iPhone15),
            @"iPhone15,5" : @(iPhone15Plus),
            @"iPhone16,1" : @(iPhone15Pro),
            @"iPhone16,2" : @(iPhone15ProMax),

            // iPhones (2024)
            @"iPhone17,3" : @(iPhone16),
            @"iPhone17,4" : @(iPhone16Plus),
            @"iPhone17,1" : @(iPhone16Pro),
            @"iPhone17,2" : @(iPhone16ProMax),

            // iPhones (2025)
            @"iPhone17,5" : @(iPhone16e),

            // iPads (Legacy)
            @"iPad1,1"  : @(iPad1),
            @"iPad2,1"  : @(iPad2),
            @"iPad2,2"  : @(iPad2),
            @"iPad2,3"  : @(iPad2),
            @"iPad2,4"  : @(iPad2),
            @"iPad2,5"  : @(iPadMini),
            @"iPad2,6"  : @(iPadMini),
            @"iPad2,7"  : @(iPadMini),
            @"iPad3,1"  : @(iPad3),
            @"iPad3,2"  : @(iPad3),
            @"iPad3,3"  : @(iPad3),
            @"iPad3,4"  : @(iPad4),
            @"iPad3,5"  : @(iPad4),
            @"iPad3,6"  : @(iPad4),
            @"iPad4,1"  : @(iPadAir),
            @"iPad4,2"  : @(iPadAir),
            @"iPad4,3"  : @(iPadAir),
            @"iPad4,4"  : @(iPadMini2),
            @"iPad4,5"  : @(iPadMini2),
            @"iPad4,6"  : @(iPadMini2),
            @"iPad4,7"  : @(iPadMini3),
            @"iPad4,8"  : @(iPadMini3),
            @"iPad4,9"  : @(iPadMini3),
            @"iPad5,1"  : @(iPadMini4),
            @"iPad5,2"  : @(iPadMini4),
            @"iPad5,3"  : @(iPadAir2),
            @"iPad5,4"  : @(iPadAir2),
            @"iPad6,3"  : @(iPadPro9Dot7Inch),
            @"iPad6,4"  : @(iPadPro9Dot7Inch),
            @"iPad6,7"  : @(iPadPro12Dot9Inch),
            @"iPad6,8"  : @(iPadPro12Dot9Inch),
            @"iPad6,11" : @(iPad5),
            @"iPad6,12" : @(iPad5),
            @"iPad7,1"  : @(iPadPro12Dot9Inch2Gen),
            @"iPad7,2"  : @(iPadPro12Dot9Inch2Gen),
            @"iPad7,3"  : @(iPadPro10Dot5Inch),
            @"iPad7,4"  : @(iPadPro10Dot5Inch),

            // iPads (2018)
            @"iPad7,5"  : @(iPad6),
            @"iPad7,6"  : @(iPad6),
            @"iPad8,1"  : @(iPadPro11Inch),
            @"iPad8,2"  : @(iPadPro11Inch),
            @"iPad8,3"  : @(iPadPro11Inch),
            @"iPad8,4"  : @(iPadPro11Inch),
            @"iPad8,5"  : @(iPadPro12Dot9Inch3Gen),
            @"iPad8,6"  : @(iPadPro12Dot9Inch3Gen),
            @"iPad8,7"  : @(iPadPro12Dot9Inch3Gen),
            @"iPad8,8"  : @(iPadPro12Dot9Inch3Gen),

            // iPads (2019)
            @"iPad7,11" : @(iPad7),
            @"iPad7,12" : @(iPad7),
            @"iPad11,1" : @(iPadMini5),
            @"iPad11,2" : @(iPadMini5),
            @"iPad11,3" : @(iPadAir3),
            @"iPad11,4" : @(iPadAir3),

            // iPads (2020)
            @"iPad11,6" : @(iPad8),
            @"iPad11,7" : @(iPad8),
            @"iPad8,9"  : @(iPadPro11Inch2Gen),
            @"iPad8,10" : @(iPadPro11Inch2Gen),
            @"iPad8,11" : @(iPadPro12Dot9Inch4Gen),
            @"iPad8,12" : @(iPadPro12Dot9Inch4Gen),
            @"iPad13,1" : @(iPadAir4),
            @"iPad13,2" : @(iPadAir4),

            // iPads (2021)
            @"iPad12,1" : @(iPad9),
            @"iPad12,2" : @(iPad9),
            @"iPad14,1" : @(iPadMini6),
            @"iPad14,2" : @(iPadMini6),
            @"iPad13,4" : @(iPadPro11Inch3Gen),
            @"iPad13,5" : @(iPadPro11Inch3Gen),
            @"iPad13,6" : @(iPadPro11Inch3Gen),
            @"iPad13,7" : @(iPadPro11Inch3Gen),
            @"iPad13,8" : @(iPadPro12Dot9Inch5Gen),
            @"iPad13,9" : @(iPadPro12Dot9Inch5Gen),
            @"iPad13,10": @(iPadPro12Dot9Inch5Gen),
            @"iPad13,11": @(iPadPro12Dot9Inch5Gen),

            // iPads (2022)
            @"iPad13,18": @(iPad10),
            @"iPad13,19": @(iPad10),
            @"iPad14,3" : @(iPadPro11Inch4Gen),
            @"iPad14,4" : @(iPadPro11Inch4Gen),
            @"iPad14,5" : @(iPadPro12Dot9Inch6Gen),
            @"iPad14,6" : @(iPadPro12Dot9Inch6Gen),
            @"iPad13,16": @(iPadAir5),
            @"iPad13,17": @(iPadAir5),

            // iPads (2024)
            @"iPad16,3" : @(iPadPro11InchM4),
            @"iPad16,4" : @(iPadPro11InchM4),
            @"iPad16,5" : @(iPadPro13InchM4),
            @"iPad16,6" : @(iPadPro13InchM4),
            @"iPad14,8" : @(iPadAir11InchM2),
            @"iPad14,9" : @(iPadAir11InchM2),
            @"iPad14,10": @(iPadAir13InchM2),
            @"iPad14,11": @(iPadAir13InchM2),
            @"iPad16,1" : @(iPadMini7),
            @"iPad16,2" : @(iPadMini7),

            // iPods
            @"iPod1,1" : @(iPodTouch1Gen),
            @"iPod2,1" : @(iPodTouch2Gen),
            @"iPod3,1" : @(iPodTouch3Gen),
            @"iPod4,1" : @(iPodTouch4Gen),
            @"iPod5,1" : @(iPodTouch5Gen),
            @"iPod7,1" : @(iPodTouch6Gen),
            @"iPod9,1" : @(iPodTouch7Gen)
        };
    });

    return deviceNamesByCode;
}

+ (DeviceVersion)deviceVersion
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *code = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];

    DeviceVersion version = (DeviceVersion)[[self.deviceNamesByCode objectForKey:code] integerValue];

    return version;
}

+ (DeviceSize)resolutionSize
{
    CGFloat screenHeight = MAX([[UIScreen mainScreen] bounds].size.height, [[UIScreen mainScreen] bounds].size.width);

    if (screenHeight == 480) {
        return Screen3Dot5inch;
    } else if (screenHeight == 568) {
        return Screen4inch;
    } else if (screenHeight == 667) {
        return Screen4Dot7inch;
    } else if (screenHeight == 736) {
        return Screen5Dot5inch;
    } else if (screenHeight == 812) {
        // Could be 5.4" (12/13 mini) or 5.8" (X/XS/11 Pro)
        DeviceVersion device = [self deviceVersion];
        if (device == iPhone12Mini || device == iPhone13Mini) {
            return Screen5Dot4inch;
        }
        return Screen5Dot8inch;
    } else if (screenHeight == 844) {
        return Screen6Dot1inch;
    } else if (screenHeight == 852) {
        return Screen6Dot1inch;
    } else if (screenHeight == 874) {
        return Screen6Dot3inch;
    } else if (screenHeight == 896) {
        // Could be 6.5" @3x or 6.1" @2x
        if ([UIScreen mainScreen].scale == 3) {
            return Screen6Dot5inch;
        }
        return Screen6Dot1inch;
    } else if (screenHeight == 926) {
        return Screen6Dot7inch;
    } else if (screenHeight == 932) {
        return Screen6Dot7inch;
    } else if (screenHeight == 956) {
        return Screen6Dot9inch;
    } else {
        return UnknownSize;
    }
}

+ (DeviceSize)deviceSize
{
    DeviceSize deviceSize = [self resolutionSize];
    if ([self isZoomed]) {
        if (deviceSize == Screen4inch) {
            deviceSize = Screen4Dot7inch;
        } else if (deviceSize == Screen4Dot7inch) {
            deviceSize = Screen5Dot5inch;
        }
    }
    return deviceSize;
}

+ (NSString *)deviceSizeName:(DeviceSize)deviceSize
{
    return @{
        @(UnknownSize)     : @"Unknown Size",
        @(Screen3Dot5inch) : @"3.5 inch",
        @(Screen4inch)     : @"4 inch",
        @(Screen4Dot7inch) : @"4.7 inch",
        @(Screen5Dot4inch) : @"5.4 inch",
        @(Screen5Dot5inch) : @"5.5 inch",
        @(Screen5Dot8inch) : @"5.8 inch",
        @(Screen6Dot1inch) : @"6.1 inch",
        @(Screen6Dot3inch) : @"6.3 inch",
        @(Screen6Dot5inch) : @"6.5 inch",
        @(Screen6Dot7inch) : @"6.7 inch",
        @(Screen6Dot9inch) : @"6.9 inch"
    }[@(deviceSize)];
}

+ (NSString *)deviceNameString
{
    return [SDiOSVersion deviceNameForVersion:[SDiOSVersion deviceVersion]];
}

+ (NSString *)deviceNameForVersion:(DeviceVersion)deviceVersion
{
    return @{
        // iPhones (Legacy)
        @(iPhone4)              : @"iPhone 4",
        @(iPhone4S)             : @"iPhone 4S",
        @(iPhone5)              : @"iPhone 5",
        @(iPhone5C)             : @"iPhone 5C",
        @(iPhone5S)             : @"iPhone 5S",
        @(iPhone6)              : @"iPhone 6",
        @(iPhone6Plus)          : @"iPhone 6 Plus",
        @(iPhone6S)             : @"iPhone 6S",
        @(iPhone6SPlus)         : @"iPhone 6S Plus",
        @(iPhone7)              : @"iPhone 7",
        @(iPhone7Plus)          : @"iPhone 7 Plus",
        @(iPhone8)              : @"iPhone 8",
        @(iPhone8Plus)          : @"iPhone 8 Plus",
        @(iPhoneX)              : @"iPhone X",
        @(iPhoneSE)             : @"iPhone SE",

        // iPhones (2018)
        @(iPhoneXS)             : @"iPhone XS",
        @(iPhoneXSMax)          : @"iPhone XS Max",
        @(iPhoneXR)             : @"iPhone XR",

        // iPhones (2019)
        @(iPhone11)             : @"iPhone 11",
        @(iPhone11Pro)          : @"iPhone 11 Pro",
        @(iPhone11ProMax)       : @"iPhone 11 Pro Max",

        // iPhones (2020)
        @(iPhoneSE2)            : @"iPhone SE (2nd generation)",
        @(iPhone12Mini)         : @"iPhone 12 mini",
        @(iPhone12)             : @"iPhone 12",
        @(iPhone12Pro)          : @"iPhone 12 Pro",
        @(iPhone12ProMax)       : @"iPhone 12 Pro Max",

        // iPhones (2021)
        @(iPhone13Mini)         : @"iPhone 13 mini",
        @(iPhone13)             : @"iPhone 13",
        @(iPhone13Pro)          : @"iPhone 13 Pro",
        @(iPhone13ProMax)       : @"iPhone 13 Pro Max",

        // iPhones (2022)
        @(iPhoneSE3)            : @"iPhone SE (3rd generation)",
        @(iPhone14)             : @"iPhone 14",
        @(iPhone14Plus)         : @"iPhone 14 Plus",
        @(iPhone14Pro)          : @"iPhone 14 Pro",
        @(iPhone14ProMax)       : @"iPhone 14 Pro Max",

        // iPhones (2023)
        @(iPhone15)             : @"iPhone 15",
        @(iPhone15Plus)         : @"iPhone 15 Plus",
        @(iPhone15Pro)          : @"iPhone 15 Pro",
        @(iPhone15ProMax)       : @"iPhone 15 Pro Max",

        // iPhones (2024)
        @(iPhone16)             : @"iPhone 16",
        @(iPhone16Plus)         : @"iPhone 16 Plus",
        @(iPhone16Pro)          : @"iPhone 16 Pro",
        @(iPhone16ProMax)       : @"iPhone 16 Pro Max",

        // iPhones (2025)
        @(iPhone16e)            : @"iPhone 16e",

        // iPads (Legacy)
        @(iPad1)                : @"iPad 1",
        @(iPad2)                : @"iPad 2",
        @(iPadMini)             : @"iPad mini",
        @(iPad3)                : @"iPad 3",
        @(iPad4)                : @"iPad 4",
        @(iPadAir)              : @"iPad Air",
        @(iPadMini2)            : @"iPad mini 2",
        @(iPadAir2)             : @"iPad Air 2",
        @(iPadMini3)            : @"iPad mini 3",
        @(iPadMini4)            : @"iPad mini 4",
        @(iPadPro9Dot7Inch)     : @"iPad Pro (9.7-inch)",
        @(iPadPro12Dot9Inch)    : @"iPad Pro (12.9-inch)",
        @(iPad5)                : @"iPad (5th generation)",
        @(iPadPro10Dot5Inch)    : @"iPad Pro (10.5-inch)",
        @(iPadPro12Dot9Inch2Gen): @"iPad Pro (12.9-inch, 2nd generation)",

        // iPads (2018)
        @(iPad6)                : @"iPad (6th generation)",
        @(iPadPro11Inch)        : @"iPad Pro (11-inch)",
        @(iPadPro12Dot9Inch3Gen): @"iPad Pro (12.9-inch, 3rd generation)",

        // iPads (2019)
        @(iPad7)                : @"iPad (7th generation)",
        @(iPadMini5)            : @"iPad mini (5th generation)",
        @(iPadAir3)             : @"iPad Air (3rd generation)",

        // iPads (2020)
        @(iPad8)                : @"iPad (8th generation)",
        @(iPadPro11Inch2Gen)    : @"iPad Pro (11-inch, 2nd generation)",
        @(iPadPro12Dot9Inch4Gen): @"iPad Pro (12.9-inch, 4th generation)",
        @(iPadAir4)             : @"iPad Air (4th generation)",

        // iPads (2021)
        @(iPad9)                : @"iPad (9th generation)",
        @(iPadMini6)            : @"iPad mini (6th generation)",
        @(iPadPro11Inch3Gen)    : @"iPad Pro (11-inch, 3rd generation)",
        @(iPadPro12Dot9Inch5Gen): @"iPad Pro (12.9-inch, 5th generation)",

        // iPads (2022)
        @(iPad10)               : @"iPad (10th generation)",
        @(iPadPro11Inch4Gen)    : @"iPad Pro (11-inch, 4th generation)",
        @(iPadPro12Dot9Inch6Gen): @"iPad Pro (12.9-inch, 6th generation)",
        @(iPadAir5)             : @"iPad Air (5th generation)",

        // iPads (2024)
        @(iPadPro11InchM4)      : @"iPad Pro (11-inch, M4)",
        @(iPadPro13InchM4)      : @"iPad Pro (13-inch, M4)",
        @(iPadAir11InchM2)      : @"iPad Air (11-inch, M2)",
        @(iPadAir13InchM2)      : @"iPad Air (13-inch, M2)",
        @(iPadMini7)            : @"iPad mini (7th generation)",

        // iPods
        @(iPodTouch1Gen)        : @"iPod touch (1st generation)",
        @(iPodTouch2Gen)        : @"iPod touch (2nd generation)",
        @(iPodTouch3Gen)        : @"iPod touch (3rd generation)",
        @(iPodTouch4Gen)        : @"iPod touch (4th generation)",
        @(iPodTouch5Gen)        : @"iPod touch (5th generation)",
        @(iPodTouch6Gen)        : @"iPod touch (6th generation)",
        @(iPodTouch7Gen)        : @"iPod touch (7th generation)",

        @(Simulator)            : @"Simulator",
        @(UnknownDevice)        : @"Unknown Device"
    }[@(deviceVersion)];
}

+ (BOOL)isZoomed
{
    if ([self resolutionSize] == Screen4inch && [UIScreen mainScreen].nativeScale > 2) {
        return YES;
    } else if ([self resolutionSize] == Screen4Dot7inch && [UIScreen mainScreen].scale == 3) {
        return YES;
    }

    return NO;
}

+ (BOOL)versionEqualTo:(NSString *)version
{
    return ([[[UIDevice currentDevice] systemVersion] compare:version options:NSNumericSearch] == NSOrderedSame);
}

+ (BOOL)versionGreaterThan:(NSString *)version
{
    return ([[[UIDevice currentDevice] systemVersion] compare:version options:NSNumericSearch] == NSOrderedDescending);
}

+ (BOOL)versionGreaterThanOrEqualTo:(NSString *)version
{
    return ([[[UIDevice currentDevice] systemVersion] compare:version options:NSNumericSearch] != NSOrderedAscending);
}

+ (BOOL)versionLessThan:(NSString *)version
{
    return ([[[UIDevice currentDevice] systemVersion] compare:version options:NSNumericSearch] == NSOrderedAscending);
}

+ (BOOL)versionLessThanOrEqualTo:(NSString *)version
{
    return ([[[UIDevice currentDevice] systemVersion] compare:version options:NSNumericSearch] != NSOrderedDescending);
}

@end
