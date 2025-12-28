//
//  SDtvOSVersion.h
//  SDVersion
//
//  Copyright (c) 2016-2025 Sebastian Dobrincu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, DeviceVersion) {
    Simulator         = 0,
    AppleTVHD         = 1,  // AppleTV5,3 - 4th Gen (HD)
    AppleTV4K1stGen   = 2,  // AppleTV6,2 - 4K 1st Gen
    AppleTV4K2ndGen   = 3,  // AppleTV11,1 - 4K 2nd Gen
    AppleTV4K3rdGen   = 4   // AppleTV14,1 - 4K 3rd Gen
};

@interface SDtvOSVersion : NSObject

+ (DeviceVersion)deviceVersion;
+ (NSString *)deviceVersionName:(DeviceVersion)deviceVersion;
+ (NSString *)deviceName;

+ (BOOL)versionEqualTo:(NSString *)version;
+ (BOOL)versionGreaterThan:(NSString *)version;
+ (BOOL)versionGreaterThanOrEqualTo:(NSString *)version;
+ (BOOL)versionLessThan:(NSString *)version;
+ (BOOL)versionLessThanOrEqualTo:(NSString *)version;

@end
