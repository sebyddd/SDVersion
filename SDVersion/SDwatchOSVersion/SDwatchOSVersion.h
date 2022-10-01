//
//  SDwatchOSVersion.h
//  SDVersion
//
//  Copyright © 2016 Sebastian Dobrincu. All rights reserved.
//

#import <WatchKit/WatchKit.h>

typedef NS_ENUM(NSInteger, DeviceVersion) {
    AppleWatch38mm        = 1,
    AppleWatch42mm        ,
    AppleWatch38mmSeries1 ,
    AppleWatch42mmSeries1 ,
    AppleWatch38mmSeries2 ,
    AppleWatch42mmSeries2 ,
    AppleWatch38mmSeries3 ,
    AppleWatch42mmSeries3 ,
    AppleWatch40mmSeries4 ,
    AppleWatch44mmSeries4 ,
    AppleWatch40mmSeries5 ,
    AppleWatch44mmSeries5 ,
    AppleWatch40mmSE      ,
    AppleWatch44mmSE      ,
    AppleWatch40mmSeries6 ,
    AppleWatch44mmSeries6 ,
    AppleWatch41mmSeries7 ,
    AppleWatch45mmSeries7 ,
    AppleWatch40mmSE2     ,
    AppleWatch44mmSE2     ,
    AppleWatch41mmSeries8 ,
    AppleWatch45mmSeries8 ,
    AppleWatch49mmUltra ,
    
    Simulator = 0
};

typedef NS_ENUM(NSInteger, DeviceSize) {
    UnknownSize = 0,
    Screen38mm,
    Screen40mm,
    Screen41mm,
    Screen42mm,
    Screen44mm,
    Screen45mm,
    Screen49mm,
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
