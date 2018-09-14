//
//  SDiOSVersion.h
//  SDVersion
//
//  Copyright (c) 2016 Sebastian Dobrincu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, DeviceVersion){
    UnknownDevice         = 0,
    Simulator             = 1,
	
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
    iPhoneXS              = 18,
    iPhoneXR              = 19,
    iPhoneXSMax           = 20,
    
    iPad1                 = 21,
    iPad2                 = 22,
    iPadMini              = 23,
    iPad3                 = 24,
    iPad4                 = 25,
    iPadAir               = 26,
    iPadMini2             = 27,
    iPadAir2              = 28,
    iPadMini3             = 29,
    iPadMini4             = 30,
    iPadPro12Dot9Inch     = 31,
    iPadPro9Dot7Inch      = 32,
    iPad5                 = 33,
    iPadPro12Dot9Inch2Gen = 34,
    iPadPro10Dot5Inch     = 35,
    
    iPodTouch1Gen         = 36,
    iPodTouch2Gen         = 37,
    iPodTouch3Gen         = 38,
    iPodTouch4Gen         = 39,
    iPodTouch5Gen         = 40,
    iPodTouch6Gen         = 41
};

typedef NS_ENUM(NSInteger, DeviceSize){
    UnknownSize     = 0,
    Screen3Dot5inch = 1,
    Screen4inch     = 2,
    Screen4Dot7inch = 3,
    Screen5Dot5inch = 4,
    Screen5Dot8inch = 5,
    Screen6Dot1inch = 6,
    Screen6Dot5inch = 7
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
