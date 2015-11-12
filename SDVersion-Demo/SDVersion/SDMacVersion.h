//
//  SDMacVersion.h
//  SDMacVersion
//
//  Copyright (c) 2015 Sebastian Dobrincu & Tom Baranes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

typedef NS_ENUM(NSInteger, DeviceVersion) {
    DeviceVersionUnknown = 0,
    DeviceVersionIMac,
    DeviceVersionMacMini,
    DeviceVersionMacPro,
    DeviceVersionMacBook,
    DeviceVersionMacBookAir,
    DeviceVersionMacBookPro,
    DeviceVersionXserve,
};

typedef NS_ENUM(NSInteger, DeviceSize) {
    UnknownSize = 0,
    Mac27Inch = 27,
    Mac24Inch = 24,
    Mac21Dot5Inch = 21,
    Mac20Inch = 20,
    Mac17Inch = 17,
    Mac15Inch = 15,
    Mac13Inch = 13,
    Mac12Inch = 12,
    Mac11Inch = 11
};

static NSString *DeviceSizeNames[] = {
    [UnknownSize]   = @"Unknown Size",
    [Mac27Inch]     = @"27 inch",
    [Mac24Inch]     = @"24 inch",
    [Mac21Dot5Inch] = @"21.5 inch",
    [Mac20Inch]     = @"20 inch",
    [Mac17Inch]     = @"17 inch",
    [Mac15Inch]     = @"15 inch",
    [Mac13Inch]     = @"13 inch",
    [Mac12Inch]     = @"12 inch",
    [Mac11Inch]     = @"11 inch"
};

typedef NS_ENUM(NSInteger, DeviceScreenResolution) {
    UnknownResolution,
    DeviceScreenRetina,
    DeviceScreenNoRetina
};

static NSString *DeviceScreenResolutionNames[] = {
    [UnknownResolution]    = @"Unknown resolution",
    [DeviceScreenRetina]   = @"Retina screen",
    [DeviceScreenNoRetina] = @"Non-retina screen"
};

@interface SDMacVersion : NSObject

#define OSXVersionEqualTo(v)               ([[@([[NSProcessInfo processInfo]operatingSystemVersion].minorVersion) stringValue] compare:v options:NSNumericSearch] == NSOrderedSame)
#define OSXVersionGreaterThan(v)           ([[@([[NSProcessInfo processInfo]operatingSystemVersion].minorVersion) stringValue] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define OSXVersionGreaterThanOrEqualTo(v)  ([[@([[NSProcessInfo processInfo]operatingSystemVersion].minorVersion) stringValue] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define OSXVersionLessThan(v)              ([[@([[NSProcessInfo processInfo]operatingSystemVersion].minorVersion) stringValue] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define OSXVersionLessThanOrEqualTo(v)     ([[@([[NSProcessInfo processInfo]operatingSystemVersion].minorVersion) stringValue]compare:v options:NSNumericSearch] != NSOrderedDescending)

+ (DeviceVersion)deviceVersion;
+ (NSString *)deviceVersionString;
+ (DeviceSize)deviceSize;
+ (NSSize)deviceScreenResolutionPixelSize;
+ (DeviceScreenResolution)deviceScreenResolution;

@end
