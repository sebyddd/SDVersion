//
//  SDiOSVersion.h
//  SDVersion
//
//  Copyright (c) 2016 Sebastian Dobrincu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, DeviceVersion){
    UnknownDevice     = 0,
    Simulator         = 1,
	
    iPhone4           = 3,
    iPhone4S          = 4,
    iPhone5           = 5,
    iPhone5C          = 6,
    iPhone5S          = 7,
    iPhone6           = 8,
    iPhone6Plus       = 9,
    iPhone6S          = 10,
    iPhone6SPlus      = 11,
    iPhone7           = 12,
    iPhone7Plus       = 13,
    iPhoneSE          = 14,
    
    iPad1             = 15,
    iPad2             = 16,
    iPadMini          = 17,
    iPad3             = 18,
    iPad4             = 19,
    iPadAir           = 20,
    iPadMini2         = 21,
    iPadAir2          = 22,
    iPadMini3         = 23,
    iPadMini4         = 24,
    iPadPro12Dot9Inch = 25,
    iPadPro9Dot7Inch  = 26,
    iPad5             = 27,
    
    iPodTouch1Gen     = 28,
    iPodTouch2Gen     = 29,
    iPodTouch3Gen     = 30,
    iPodTouch4Gen     = 31,
    iPodTouch5Gen     = 32,
    iPodTouch6Gen     = 33
};

typedef NS_ENUM(NSInteger, DeviceSize){
    UnknownSize     = 0,
    Screen3Dot5inch = 1,
    Screen4inch     = 2,
    Screen4Dot7inch = 3,
    Screen5Dot5inch = 4
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
