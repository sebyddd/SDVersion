//
//  SDwatchOSVersion.h
//  SDVersion
//
//  Copyright (c) 2016-2025 Sebastian Dobrincu. All rights reserved.
//

#import <WatchKit/WatchKit.h>

typedef NS_ENUM(NSInteger, DeviceVersion) {
    Simulator = 0,

    // Original & Series 1-2 (Legacy)
    AppleWatch38mm        = 1,
    AppleWatch42mm        = 2,
    AppleWatch38mmSeries1 = 3,
    AppleWatch42mmSeries1 = 4,
    AppleWatch38mmSeries2 = 5,
    AppleWatch42mmSeries2 = 6,

    // Series 3 (38mm/42mm)
    AppleWatch38mmSeries3 = 7,
    AppleWatch42mmSeries3 = 8,

    // Series 4 (40mm/44mm)
    AppleWatch40mmSeries4 = 10,
    AppleWatch44mmSeries4 = 11,

    // Series 5 (40mm/44mm)
    AppleWatch40mmSeries5 = 12,
    AppleWatch44mmSeries5 = 13,

    // SE 1st Gen (40mm/44mm)
    AppleWatchSE40mm      = 14,
    AppleWatchSE44mm      = 15,

    // Series 6 (40mm/44mm)
    AppleWatch40mmSeries6 = 16,
    AppleWatch44mmSeries6 = 17,

    // Series 7 (41mm/45mm)
    AppleWatch41mmSeries7 = 18,
    AppleWatch45mmSeries7 = 19,

    // SE 2nd Gen (40mm/44mm)
    AppleWatchSE2_40mm    = 20,
    AppleWatchSE2_44mm    = 21,

    // Series 8 (41mm/45mm)
    AppleWatch41mmSeries8 = 22,
    AppleWatch45mmSeries8 = 23,

    // Ultra (49mm)
    AppleWatchUltra49mm   = 24,

    // Series 9 (41mm/45mm)
    AppleWatch41mmSeries9 = 25,
    AppleWatch45mmSeries9 = 26,

    // Ultra 2 (49mm)
    AppleWatchUltra2_49mm = 27,

    // Series 10 (42mm/46mm)
    AppleWatch42mmSeries10 = 28,
    AppleWatch46mmSeries10 = 29
};

typedef NS_ENUM(NSInteger, DeviceSize) {
    UnknownSize = 0,
    Screen38mm  = 1,
    Screen40mm  = 2,
    Screen41mm  = 3,
    Screen42mm  = 4,
    Screen44mm  = 5,
    Screen45mm  = 6,
    Screen46mm  = 7,
    Screen49mm  = 8
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
