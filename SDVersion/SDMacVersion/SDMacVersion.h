//
//  SDMacVersion.h
//  SDMacVersion
//
//  Copyright (c) 2015-2025 Sebastian Dobrincu & Tom Baranes. All rights reserved.
//

#import <Cocoa/Cocoa.h>

typedef NS_ENUM(NSInteger, DeviceVersion) {
    DeviceVersionUnknown = 0,
    DeviceVersionIMac,
    DeviceVersionMacMini,
    DeviceVersionMacPro,
    DeviceVersionMacBook,
    DeviceVersionMacBookAir,
    DeviceVersionMacBookPro,
    DeviceVersionMacStudio,
    DeviceVersionXserve
};

typedef NS_ENUM(NSInteger, DeviceSize) {
    UnknownSize = 0,
    Mac27Inch = 27,
    Mac24Inch = 24,
    Mac21Dot5Inch = 21,
    Mac20Inch = 20,
    Mac17Inch = 17,
    Mac16Inch = 16,
    Mac15Inch = 15,
    Mac14Inch = 14,
    Mac13Inch = 13,
    Mac12Inch = 12,
    Mac11Inch = 11
};

typedef NS_ENUM(NSInteger, DeviceScreenResolution) {
    UnknownResolution,
    DeviceScreenRetina,
    DeviceScreenNoRetina
};

typedef NS_ENUM(NSInteger, ChipType) {
    ChipTypeUnknown = 0,
    ChipTypeIntel,
    ChipTypeM1,
    ChipTypeM1Pro,
    ChipTypeM1Max,
    ChipTypeM1Ultra,
    ChipTypeM2,
    ChipTypeM2Pro,
    ChipTypeM2Max,
    ChipTypeM2Ultra,
    ChipTypeM3,
    ChipTypeM3Pro,
    ChipTypeM3Max,
    ChipTypeM4,
    ChipTypeM4Pro,
    ChipTypeM4Max
};

@interface SDMacVersion : NSObject

+ (DeviceVersion)deviceVersion;
+ (NSString *)deviceVersionString;
+ (DeviceSize)deviceSize;
+ (NSString *)deviceSizeName:(DeviceSize)deviceSize;
+ (NSSize)deviceScreenResolutionPixelSize;
+ (DeviceScreenResolution)deviceScreenResolution;
+ (NSString *)deviceScreenResolutionName:(DeviceScreenResolution)deviceScreenResolution;
+ (BOOL)isAppleSilicon;
+ (ChipType)chipType;
+ (NSString *)chipName;

+ (BOOL)versionEqualTo:(NSString *)version;
+ (BOOL)versionGreaterThan:(NSString *)version;
+ (BOOL)versionGreaterThanOrEqualTo:(NSString *)version;
+ (BOOL)versionLessThan:(NSString *)version;
+ (BOOL)versionLessThanOrEqualTo:(NSString *)version;

@end
