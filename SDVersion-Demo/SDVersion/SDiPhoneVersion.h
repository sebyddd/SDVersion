//
//  SDiPhoneVersion.h
//  SDVersion
//
//  Copyright (c) 2015 Sebastian Dobrincu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>
#import <sys/utsname.h>

#define stringFromDeviceVersion(v) [@{@(3):@"iPhone 4", @(4):@"iPhone 4S", @(5):@"iPhone 5", @(6):@"iPhone 5C", @(7):@"iPhone 5S", @(8):@"iPhone 6", @(9): @"iPhone 6 Plus", @(10):@"iPad 1", @(11):@"iPad 2", @(12):@"iPad Mini", @(13):@"iPad 3", @(14):@"iPad 4", @(15):@"iPad Air", @(16):@"iPad Mini 2", @(17):@"iPad Air 2", @(18):@"iPad Mini 3", @(0):@"Simulator"} objectForKey:[NSNumber numberWithInteger:v]]
#define stringFromDeviceSize(v) [@{@(0):@"Unknown Size", @(1):@"3.5 inch", @(2):@"4 inch", @(3):@"4.7 inch", @(4):@"5.5 inch"} objectForKey:[NSNumber numberWithInteger:v]]

@interface SDiPhoneVersion : NSObject

#define iOSVersionEqualTo(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define iOSVersionGreaterThan(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define iOSVersionGreaterThanOrEqualTo(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define iOSVersionLessThan(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define iOSVersionLessThanOrEqualTo(v)        ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

typedef NS_ENUM(NSInteger, DeviceVersion){
    iPhone4 = 3,
    iPhone4S = 4,
    iPhone5 = 5,
    iPhone5C = 6,
    iPhone5S = 7,
    iPhone6 = 8,
    iPhone6Plus = 9,
    
    iPad1 = 10,
    iPad2 = 11,
    iPadMini = 12,
    iPad3 = 13,
    iPad4 = 14,
    iPadAir = 15,
    iPadMini2 = 16,
    iPadAir2 = 17,
    iPadMini3 = 18,
    Simulator = 0
};

typedef NS_ENUM(NSInteger, DeviceSize){
    UnknownSize = 0,
    iPhone3Dot5inch = 1,
    iPhone4inch = 2,
    iPhone4Dot7inch = 3,
    iPhone5Dot5inch = 4
};

+(DeviceVersion)deviceVersion;
+(DeviceSize)deviceSize;
+(NSString*)deviceName;

@end
