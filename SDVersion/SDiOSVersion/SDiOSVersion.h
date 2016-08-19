//
//  SDiOSVersion.h
//  SDVersion
//
//  Copyright (c) 2016 Sebastian Dobrincu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>
#import <sys/utsname.h>

typedef NS_ENUM(NSInteger, DeviceVersion) {
    iPhone            NS_ENUM_DEPRECATED_IOS(1.0, 4.0)  =  0,
    iPhone3G          NS_ENUM_DEPRECATED_IOS(2.0, 5.0)  =  1,
    iPhone3GS         NS_ENUM_DEPRECATED_IOS(3.0, 7.0)  =  2,
    iPhone4           NS_ENUM_DEPRECATED_IOS(4.0, 8.0)  =  3,
    iPhone4S          NS_ENUM_DEPRECATED_IOS(5.0, 10.0) =  4,
    iPhone5           NS_ENUM_AVAILABLE_IOS(6.0)        =  5,
    iPhone5C          NS_ENUM_AVAILABLE_IOS(7.0)        =  6,
    iPhone5S          NS_ENUM_AVAILABLE_IOS(7.0)        =  7,
    iPhone6           NS_ENUM_AVAILABLE_IOS(8.0)        =  8,
    iPhone6Plus       NS_ENUM_AVAILABLE_IOS(8.0)        =  9,
    iPhone6S          NS_ENUM_AVAILABLE_IOS(9.0)        = 10,
    iPhone6SPlus      NS_ENUM_AVAILABLE_IOS(9.0)        = 11,
    iPhoneSE          NS_ENUM_AVAILABLE_IOS(9.3)        = 12,
    
    iPad1             NS_ENUM_DEPRECATED_IOS(3.2, 6.0)  = 13,
    iPad2             NS_ENUM_DEPRECATED_IOS(4.3, 10.0) = 14,
    iPadMini          NS_ENUM_DEPRECATED_IOS(6.0, 10.0) = 15,
    iPad3             NS_ENUM_DEPRECATED_IOS(5.1, 10.0) = 16,
    iPad4             NS_ENUM_AVAILABLE_IOS(6.0)        = 17,
    iPadAir           NS_ENUM_AVAILABLE_IOS(7.0)        = 18,
    iPadMini2         NS_ENUM_AVAILABLE_IOS(7.0)        = 19,
    iPadAir2          NS_ENUM_AVAILABLE_IOS(8.1)        = 20,
    iPadMini3         NS_ENUM_AVAILABLE_IOS(8.1)        = 21,
    iPadMini4         NS_ENUM_AVAILABLE_IOS(9.0)        = 22,
    iPadPro12Dot9Inch NS_ENUM_AVAILABLE_IOS(9.1)        = 23,
    iPadPro9Dot7Inch  NS_ENUM_AVAILABLE_IOS(9.3)        = 24,
    
    iPodTouch1Gen     NS_ENUM_DEPRECATED_IOS(1.1, 4.0)  = 25,
    iPodTouch2Gen     NS_ENUM_DEPRECATED_IOS(2.1, 5.0)  = 26,
    iPodTouch3Gen     NS_ENUM_DEPRECATED_IOS(3.1, 6.0)  = 27,
    iPodTouch4Gen     NS_ENUM_DEPRECATED_IOS(4.1, 7.0)  = 28,
    iPodTouch5Gen     NS_ENUM_DEPRECATED_IOS(6.0, 10.0) = 29,
    iPodTouch6Gen     NS_ENUM_AVAILABLE_IOS(8.4)        = 30,
    
    Simulator                                           = 31,
};

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
static NSString *DeviceVersionNames[] = {
    [iPhone]            = @"iPhone",
    [iPhone3G]          = @"iPhone 3G",
    [iPhone3GS]         = @"iPhone 3GS",
    [iPhone4]           = @"iPhone 4",
    [iPhone4S]          = @"iPhone 4S",
    [iPhone5]           = @"iPhone 5",
    [iPhone5C]          = @"iPhone 5C",
    [iPhone5S]          = @"iPhone 5S",
    [iPhone6]           = @"iPhone 6",
    [iPhone6Plus]       = @"iPhone 6 Plus",
    [iPhone6S]          = @"iPhone 6S",
    [iPhone6SPlus]      = @"iPhone 6S Plus",
    [iPhoneSE]          = @"iPhone SE",
    
    [iPad1]             = @"iPad 1",
    [iPad2]             = @"iPad 2",
    [iPadMini]          = @"iPad Mini",
    [iPad3]             = @"iPad 3",
    [iPad4]             = @"iPad 4",
    [iPadAir]           = @"iPad Air",
    [iPadMini2]         = @"iPad Mini 2",
    [iPadAir2]          = @"iPad Air 2",
    [iPadMini3]         = @"iPad Mini 3",
    [iPadMini4]         = @"iPad Mini 4",
    [iPadPro9Dot7Inch]  = @"iPad Pro",
    [iPadPro12Dot9Inch] = @"iPad Pro",
    
    [iPodTouch1Gen]     = @"iPod Touch 1st Gen",
    [iPodTouch2Gen]     = @"iPod Touch 2nd Gen",
    [iPodTouch3Gen]     = @"iPod Touch 3rd Gen",
    [iPodTouch4Gen]     = @"iPod Touch 4th Gen",
    [iPodTouch5Gen]     = @"iPod Touch 5th Gen",
    [iPodTouch6Gen]     = @"iPod Touch 6th Gen",
    
    [Simulator]         = @"Simulator"
};
#pragma clang diagnostic pop

typedef NS_ENUM(NSInteger, DeviceSize) {
    UnknownSize                                       = 0,
    Screen3Dot5inch NS_ENUM_DEPRECATED_IOS(1.0, 10.0) = 1,
    Screen4inch     NS_ENUM_AVAILABLE_IOS(6.0)        = 2,
    Screen4Dot7inch NS_ENUM_AVAILABLE_IOS(8.0)        = 3,
    Screen5Dot5inch NS_ENUM_AVAILABLE_IOS(8.0)        = 4,
};

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
static NSString *DeviceSizeNames[] = {
    [UnknownSize]     = @"Unknown Size",
    [Screen3Dot5inch] = @"3.5 inch",
    [Screen4inch]     = @"4 inch",
    [Screen4Dot7inch] = @"4.7 inch",
    [Screen5Dot5inch] = @"5.5 inch",
};
#pragma clang diagnostic pop

@interface SDiOSVersion : NSObject

#define iOSVersionEqualTo(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define iOSVersionGreaterThan(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define iOSVersionGreaterThanOrEqualTo(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define iOSVersionLessThan(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define iOSVersionLessThanOrEqualTo(v)        ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

+ (DeviceVersion)deviceVersion;
+ (DeviceSize)resolutionSize;
+ (DeviceSize)deviceSize;
+ (NSString*)deviceName;
+ (BOOL)isZoomed;

@end