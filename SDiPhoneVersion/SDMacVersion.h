//
//  SDMacVersion.h
//  SDiPhoneVersion
//
//  Created by Tom Baranes on 17/08/15.
//  Copyright (c) 2015 Sebastian Dobrincu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>

@interface SDMacVersion : NSObject

//#define OSXVersionEqualTo(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
//#define OSXVersionGreaterThan(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
//#define OSXVersionGreaterThanOrEqualTo(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
//#define OSXVersionLessThan(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
//#define OSXVersionLessThanOrEqualTo(v)        ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

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
	UnknownSize,
	Mac27Inch = 27,
	Mac24Inc = 24,
	Mac21Dot5Inch = 21,
	Mac20Inch = 20,
	Mac17Inch = 17,
	Mac15Inch = 15,
	Mac13Inch = 13,
	Mac12Inch = 12,
	Mac11Inch = 11
};

typedef NS_ENUM(NSInteger, DeviceReleaseYear) {
	UnknownYear,
	DeviceReleaseIn2015 = 2015,
	DeviceReleaseIn2014 = 2014,
	DeviceReleaseIn2013 = 2013
	//...
};

typedef NS_ENUM(NSInteger, DeviceScreenResolution) {
	UnknownResolution,
	DeviceScreenRetina,
	DeviceScreenNoRetina
};

+ (DeviceVersion)deviceVersion;
+ (NSString *)deviceName;
+ (DeviceReleaseYear)deviceReleaseYear;
+ (DeviceSize)deviceSize;
+ (NSSize)deviceScreenResolutionPixelSize;
+ (DeviceScreenResolution)deviceScreenResolution;

@end
