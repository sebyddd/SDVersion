//
//  SDMacVersion.h
//  SDiPhoneVersion
//
//  Created by Tom Baranes on 17/08/15.
//  Copyright (c) 2015 Sebastian Dobrincu. All rights reserved.
//

#import <Foundation/Foundation.h>

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

typedef NS_ENUM(NSInteger, DeviceSize){
	UnknownSize,
	Mac27Inch,
	Mac24Inch,
	Mac21Dot5Inch,
	Mac20Inch,
	Mac17Inch,
	Mac15Inch,
	Mac13Inch,
	Mac12Inch,
	Mac11Inch,
};

typedef NS_ENUM(NSInteger, DeviceReleaseYear) {
	UnknownYear,
	DeviceReleaseIn2015,
	DeviceReleaseIn2014,
	DeviceReleaseIn2013
	//...
};

+ (DeviceVersion)deviceVersion;
+ (DeviceReleaseYear)DeviceReleaseYear;
+ (DeviceSize)deviceSize;
+ (NSString *)deviceName;
+ (BOOL)isDeviceRetina;

@end
