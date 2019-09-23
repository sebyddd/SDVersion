//
//  SDiOSVersion.m
//  SDVersion
//
//  Copyright (c) 2016 Sebastian Dobrincu. All rights reserved.
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
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        deviceNamesByCode = @{
                              //iPhones
                              @"iPhone3,1"  : @(iPhone4),
                              @"iPhone3,2"  : @(iPhone4),
                              @"iPhone3,3"  : @(iPhone4),
                              @"iPhone4,1"  : @(iPhone4S),
                              @"iPhone4,2"  : @(iPhone4S),
                              @"iPhone4,3"  : @(iPhone4S),
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
                              @"iPhone11,2" : @(iPhoneXS),
                              @"iPhone11,4" : @(iPhoneXSMax),
                              @"iPhone11,6" : @(iPhoneXSMax),
                              @"iPhone11,8" : @(iPhoneXR),
                              @"iPhone12,1" : @(iPhone11),
                              @"iPhone12,3" : @(iPhone11Pro),
                              @"iPhone12,5" : @(iPhone11ProMax),
                              @"i386"       : @(Simulator),
                              @"x86_64"     : @(Simulator),
                              
                              //iPads
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
                              @"iPad7,5"  : @(iPad6),
                              @"iPad7,6"  : @(iPad6),
                              @"iPad7,11" : @(iPad7),
                              @"iPad7,12" : @(iPad7),
                              @"iPad8,1"  : @(iPadPro11Inch),
                              @"iPad8,2"  : @(iPadPro11Inch),
                              @"iPad8,3"  : @(iPadPro11Inch),
                              @"iPad8,4"  : @(iPadPro11Inch),
                              @"iPad8,5"  : @(iPadPro12Dot9Inch3Gen),
                              @"iPad8,6"  : @(iPadPro12Dot9Inch3Gen),
                              @"iPad8,7"  : @(iPadPro12Dot9Inch3Gen),
                              @"iPad8,8"  : @(iPadPro12Dot9Inch3Gen),
                              @"iPad11,1" : @(iPadMini5),
                              @"iPad11,2" : @(iPadMini5),
                              @"iPad11,4" : @(iPadAir3),
                              @"iPad11,5" : @(iPadAir3),

                              //iPods
                              @"iPod1,1" : @(iPodTouch1Gen),
                              @"iPod2,1" : @(iPodTouch2Gen),
                              @"iPod3,1" : @(iPodTouch3Gen),
                              @"iPod4,1" : @(iPodTouch4Gen),
                              @"iPod5,1" : @(iPodTouch5Gen),
                              @"iPod7,1" : @(iPodTouch6Gen)};
#pragma clang diagnostic pop
    });
    
    return deviceNamesByCode;
}

+ (DeviceVersion)deviceVersion
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *code = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    DeviceVersion version = (DeviceVersion)[[[SDiOSVersion deviceNamesByCode] objectForKey:code] integerValue];

    return version;
}

+ (DeviceSize)resolutionSize
{
    CGFloat screenHeight = 0;
    
    if ([SDiOSVersion versionGreaterThanOrEqualTo:@"8"]) {
        screenHeight = MAX([[UIScreen mainScreen] bounds].size.height, [[UIScreen mainScreen] bounds].size.width);
    } else {
        screenHeight = [[UIScreen mainScreen] bounds].size.height;
    }
    
    if (screenHeight == 480) {
        return Screen3Dot5inch;
    } else if (screenHeight == 568) {
        return Screen4inch;
    } else if (screenHeight == 667) {
        return  Screen4Dot7inch;
    } else if (screenHeight == 736) {
        return Screen5Dot5inch;
    } else if (screenHeight == 812) {
        return Screen5Dot8inch;
    } else if (screenHeight == 896) {
            if ([SDiOSVersion deviceVersion] == iPhoneXSMax) {
                return Screen6Dot5inch;
            } else {
                return Screen6Dot1inch;
            }
    } else
        return UnknownSize;
}

+ (DeviceSize)deviceSize
{
    DeviceSize deviceSize = [SDiOSVersion resolutionSize];
    if ([SDiOSVersion isZoomed]) {
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
             @(Screen5Dot5inch) : @"5.5 inch",
             @(Screen5Dot8inch) : @"5.8 inch",
             @(Screen6Dot1inch) : @"6.1 inch",
             @(Screen6Dot5inch) : @"6.5 inch"
             }[@(deviceSize)];
}

+ (NSString *)deviceNameString
{
    return [SDiOSVersion deviceNameForVersion:[SDiOSVersion deviceVersion]];
}

+ (NSString *)deviceNameForVersion:(DeviceVersion)deviceVersion
{
    return @{
             @(iPhone4)              : @"iPhone 4",
             @(iPhone4S)             : @"iPhone 4S",
             @(iPhone5)              : @"iPhone 5",
             @(iPhone5C)             : @"iPhone 5C",
             @(iPhone5S)             : @"iPhone 5S",
             @(iPhone6)              : @"iPhone 6",
             @(iPhone6Plus)          : @"iPhone 6 Plus",
             @(iPhone6S)             : @"iPhone 6S",
             @(iPhone6SPlus)         : @"iPhone 6S Plus",
             @(iPhoneSE)             : @"iPhone SE",
             @(iPhone7)              : @"iPhone 7",
             @(iPhone7Plus)          : @"iPhone 7 Plus",
             @(iPhone8)              : @"iPhone 8",
             @(iPhone8Plus)          : @"iPhone 8 Plus",
             @(iPhoneX)              : @"iPhone X",
             @(iPhoneXS)             : @"iPhone XS",
             @(iPhoneXSMax)          : @"iPhone XS Max",
             @(iPhoneXR)             : @"iPhone XR",
             @(iPhone11)             : @"iPhone 11",
             @(iPhone11Pro)          : @"iPhone 11 Pro",
             @(iPhone11ProMax)       : @"iPhone 11 Pro Max",
             
             @(iPad1)                : @"iPad 1",
             @(iPad2)                : @"iPad 2",
             @(iPadMini)             : @"iPad Mini",
             @(iPad3)                : @"iPad 3",
             @(iPad4)                : @"iPad 4",
             @(iPadAir)              : @"iPad Air",
             @(iPadMini2)            : @"iPad Mini 2",
             @(iPadAir2)             : @"iPad Air 2",
             @(iPadMini3)            : @"iPad Mini 3",
             @(iPadMini4)            : @"iPad Mini 4",
             @(iPadPro9Dot7Inch)     : @"iPad Pro 9.7 inch",
             @(iPadPro12Dot9Inch)    : @"iPad Pro 12.9 inch 1st Gen",
             @(iPad5)                : @"iPad 5",
             @(iPadPro10Dot5Inch)    : @"iPad Pro 10.5 inch",
             @(iPadPro12Dot9Inch2Gen): @"iPad Pro 12.9 inch 2nd Gen",
             @(iPad6)                : @"iPad 6",
             @(iPad7)                : @"iPad 7",
             @(iPadAir3)             : @"iPad Air 3rd Gen",
             @(iPadMini5)            : @"iPad Mini 5",
             @(iPadPro11Inch)        : @"iPad Pro 11 inch",
             @(iPadPro12Dot9Inch3Gen): @"iPad Pro 12.9 inch 3rd Gen",
             
             @(iPodTouch1Gen)        : @"iPod Touch 1st Gen",
             @(iPodTouch2Gen)        : @"iPod Touch 2nd Gen",
             @(iPodTouch3Gen)        : @"iPod Touch 3rd Gen",
             @(iPodTouch4Gen)        : @"iPod Touch 4th Gen",
             @(iPodTouch5Gen)        : @"iPod Touch 5th Gen",
             @(iPodTouch6Gen)        : @"iPod Touch 6th Gen",
             
             @(Simulator)            : @"Simulator",
             @(UnknownDevice)        : @"Unknown Device"
             }[@(deviceVersion)];
}

+ (BOOL)isZoomed
{
    if ([SDiOSVersion resolutionSize] == Screen4inch && [UIScreen mainScreen].nativeScale > 2) {
        return YES;
    }else if ([SDiOSVersion resolutionSize] == Screen4Dot7inch && [UIScreen mainScreen].scale == 3){
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
