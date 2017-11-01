//
//  SDwatchOSVersion.h
//  SDVersion
//
//  Copyright © 2016 Sebastian Dobrincu. All rights reserved.
//

#import <WatchKit/WatchKit.h>

typedef NS_ENUM(NSInteger, DeviceVersion) {
    AppleWatch38mm        = 1,
    AppleWatch42mm        = 2,
    AppleWatch38mmSeries1 = 3,
    AppleWatch42mmSeries1 = 4,
    AppleWatch38mmSeries2 = 5,
    AppleWatch42mmSeries2 = 6,
    AppleWatch38mmSeries3 = 7,
    AppleWatch42mmSeries3 = 8,
    
    Simulator = 0
};

typedef NS_ENUM(NSInteger, DeviceSize) {
    UnknownSize = 0,
    Screen38mm  = 1,
    Screen42mm  = 2
};

@interface SDwatchOSVersion : NSObject

+ (DeviceVersion)deviceVersion;
+ (NSString *)deviceVersionName:(DeviceVersion)deviceVersion;
+ (DeviceSize)deviceSize;
+ (NSString *)deviceSizeName:(DeviceSize)deviceSize;
+ (NSString *)deviceName;

+ (BOOL)versionEqualTo:(NSString *)version;
+ (BOOL)versionGreaterThan:(NSString *)version;
+ (BOOL)versionGreaterThanOrEqualTo:(NSString *)version;
+ (BOOL)versionLessThan:(NSString *)version;
+ (BOOL)versionLessThanOrEqualTo:(NSString *)version;

@end
