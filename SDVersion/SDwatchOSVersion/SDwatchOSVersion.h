//
//  SDwatchOSVersion.h
//  SDVersion
//
//  Created by Jeff Kelley on 6/29/16.
//  Copyright © 2016 Sebastian Dobrincu. All rights reserved.
//

#import <WatchKit/WatchKit.h>

typedef NS_ENUM(NSInteger, DeviceVersion) {
    AppleWatch38mm = 1,
    AppleWatch42mm = 2,
    Simulator      = 0
};

static NSString *DeviceVersionNames[] = {
    [AppleWatch38mm] = @"Apple Watch 38mm",
    [AppleWatch42mm] = @"Apple Watch 42mm",
    [Simulator]      = @"Simulator"
};

typedef NS_ENUM(NSInteger, DeviceSize){
    UnknownSize = 0,
    Screen38mm  = 1,
    Screen42mm  = 2
};

static NSString *DeviceSizeNames[] = {
    [UnknownSize] = @"Unknown Size",
    [Screen38mm]  = @"38mm",
    [Screen42mm]  = @"42mm"
};

@interface SDwatchOSVersion : NSObject

#define watchOSVersionEqualTo(v)                  ([[[WKInterfaceDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define watchOSVersionGreaterThan(v)              ([[[WKInterfaceDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define watchOSVersionGreaterThanOrEqualTo(v)     ([[[WKInterfaceDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define watchOSVersionLessThan(v)                 ([[[WKInterfaceDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define watchOSVersionLessThanOrEqualTo(v)        ([[[WKInterfaceDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

+ (DeviceVersion)deviceVersion;
+ (DeviceSize)deviceSize;
+ (NSString*)deviceName;

@end
