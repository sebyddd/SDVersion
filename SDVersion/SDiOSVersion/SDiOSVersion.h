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
    iPhone11              = 21,
    iPhone11Pro           = 22,
    iPhone11ProMax        = 23,
    iPhoneSE2             = 24,
    
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
    iPad6                 = 113,
    iPadPro12Dot9Inch2Gen = 114,
    iPadPro10Dot5Inch     = 115,
    iPadPro11Inch         = 116,
    iPadAir3              = 117,
    iPad7                 = 118,
    iPadMini5             = 119,
    iPadPro12Dot9Inch4Gen = 120,
    iPadPro11Inch2Gen     = 121,
    
    iPodTouch1Gen         = 200,
    iPodTouch2Gen         = 201,
    iPodTouch3Gen         = 202,
    iPodTouch4Gen         = 203,
    iPodTouch5Gen         = 204,
    iPodTouch6Gen         = 205
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
