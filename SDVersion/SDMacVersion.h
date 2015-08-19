//
//  SDMacVersion.h
//  SDMacVersion
//
//  Copyright (c) 2015 Sebastian Dobrincu & Tom Baranes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

#define stringFromDeviceSize(s)             [@{@(0):@"Unknown Size",@(27):@"27 inch",@(24):@"24 inch",@(21):@"21.5 inch",@(20):@"20 inch",@(17):@"17 inch",@(15):@"15 inch",@(13):@"13 inch",@(12):@"12 inch", @(11):@"11 inch"} objectForKey:[NSNumber numberWithInteger:s]]
#define stringFromDeviceResolution(r) [@[@"Unknown resolution",@"Retina screen",@"Non-retina screen"] objectAtIndex:r]

@interface SDMacVersion : NSObject

#define OSXVersionEqualTo(v)               ([[@([[NSProcessInfo processInfo]operatingSystemVersion].minorVersion) stringValue] compare:v options:NSNumericSearch] == NSOrderedSame)
#define OSXVersionGreaterThan(v)           ([[@([[NSProcessInfo processInfo]operatingSystemVersion].minorVersion) stringValue] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define OSXVersionGreaterThanOrEqualTo(v)  ([[@([[NSProcessInfo processInfo]operatingSystemVersion].minorVersion) stringValue] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define OSXVersionLessThan(v)              ([[@([[NSProcessInfo processInfo]operatingSystemVersion].minorVersion) stringValue] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define OSXVersionLessThanOrEqualTo(v)     ([[@([[NSProcessInfo processInfo]operatingSystemVersion].minorVersion) stringValue]compare:v options:NSNumericSearch] != NSOrderedDescending)

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

typedef NS_ENUM(NSInteger, DeviceScreenResolution) {
	UnknownResolution,
	DeviceScreenRetina,
	DeviceScreenNoRetina
};

+ (DeviceVersion)deviceVersion;
+ (NSString *)deviceVersionString;
+ (DeviceSize)deviceSize;
+ (NSSize)deviceScreenResolutionPixelSize;
+ (DeviceScreenResolution)deviceScreenResolution;

@end
