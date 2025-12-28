//
//  SDMacVersion.m
//  SDMacVersion
//
//  Copyright (c) 2015-2025 Sebastian Dobrincu & Tom Baranes. All rights reserved.
//

#include <stdlib.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/sysctl.h>
#import "SDMacVersion.h"

@implementation SDMacVersion

static NSString * const SDMacDeviceName  = @"SDMacDeviceName";
static NSString * const SDMacVersionEnum = @"SDMacVersionEnum";
static NSString * const SDMacScreenSize  = @"SDMacReleaseSize";
static NSString * const SDMacResolution  = @"SDMacResolution";
static NSString * const SDMacChipType    = @"SDMacChipType";

#pragma mark - Models

+ (NSDictionary *)deviceInformationForModel:(NSString *)model {
    __block NSMutableDictionary *mutableDic = [NSMutableDictionary dictionary];
    static NSDictionary *deviceDic = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // Determine device type and chip
        ChipType chipType = ChipTypeIntel;

        // Mac Studio (Apple Silicon only)
        if ([model hasPrefix:@"Mac13,1"]) {
            mutableDic[SDMacDeviceName] = @"Mac Studio";
            mutableDic[SDMacVersionEnum] = @(DeviceVersionMacStudio);
            chipType = ChipTypeM1Max;
        }
        else if ([model hasPrefix:@"Mac13,2"]) {
            mutableDic[SDMacDeviceName] = @"Mac Studio";
            mutableDic[SDMacVersionEnum] = @(DeviceVersionMacStudio);
            chipType = ChipTypeM1Ultra;
        }
        else if ([model hasPrefix:@"Mac14,13"]) {
            mutableDic[SDMacDeviceName] = @"Mac Studio";
            mutableDic[SDMacVersionEnum] = @(DeviceVersionMacStudio);
            chipType = ChipTypeM2Max;
        }
        else if ([model hasPrefix:@"Mac14,14"]) {
            mutableDic[SDMacDeviceName] = @"Mac Studio";
            mutableDic[SDMacVersionEnum] = @(DeviceVersionMacStudio);
            chipType = ChipTypeM2Ultra;
        }
        // Mac Pro (Apple Silicon)
        else if ([model hasPrefix:@"Mac14,8"]) {
            mutableDic[SDMacDeviceName] = @"Mac Pro";
            mutableDic[SDMacVersionEnum] = @(DeviceVersionMacPro);
            chipType = ChipTypeM2Ultra;
        }
        else if ([model hasPrefix:@"MacPro"]) {
            mutableDic[SDMacDeviceName] = @"Mac Pro";
            mutableDic[SDMacVersionEnum] = @(DeviceVersionMacPro);
            chipType = ChipTypeIntel;
        }
        // iMac
        else if ([model hasPrefix:@"iMac21,"]) {
            mutableDic[SDMacDeviceName] = @"iMac";
            mutableDic[SDMacVersionEnum] = @(DeviceVersionIMac);
            chipType = ChipTypeM1;
        }
        else if ([model hasPrefix:@"Mac15,4"] || [model hasPrefix:@"Mac15,5"]) {
            mutableDic[SDMacDeviceName] = @"iMac";
            mutableDic[SDMacVersionEnum] = @(DeviceVersionIMac);
            chipType = ChipTypeM3;
        }
        else if ([model hasPrefix:@"Mac16,2"] || [model hasPrefix:@"Mac16,3"]) {
            mutableDic[SDMacDeviceName] = @"iMac";
            mutableDic[SDMacVersionEnum] = @(DeviceVersionIMac);
            chipType = ChipTypeM4;
        }
        else if ([model hasPrefix:@"iMac"]) {
            mutableDic[SDMacDeviceName] = @"iMac";
            mutableDic[SDMacVersionEnum] = @(DeviceVersionIMac);
            chipType = ChipTypeIntel;
        }
        // Mac mini
        else if ([model hasPrefix:@"Macmini9,"]) {
            mutableDic[SDMacDeviceName] = @"Mac mini";
            mutableDic[SDMacVersionEnum] = @(DeviceVersionMacMini);
            chipType = ChipTypeM1;
        }
        else if ([model hasPrefix:@"Mac14,3"]) {
            mutableDic[SDMacDeviceName] = @"Mac mini";
            mutableDic[SDMacVersionEnum] = @(DeviceVersionMacMini);
            chipType = ChipTypeM2;
        }
        else if ([model hasPrefix:@"Mac14,12"]) {
            mutableDic[SDMacDeviceName] = @"Mac mini";
            mutableDic[SDMacVersionEnum] = @(DeviceVersionMacMini);
            chipType = ChipTypeM2Pro;
        }
        else if ([model hasPrefix:@"Mac16,10"]) {
            mutableDic[SDMacDeviceName] = @"Mac mini";
            mutableDic[SDMacVersionEnum] = @(DeviceVersionMacMini);
            chipType = ChipTypeM4;
        }
        else if ([model hasPrefix:@"Mac16,11"]) {
            mutableDic[SDMacDeviceName] = @"Mac mini";
            mutableDic[SDMacVersionEnum] = @(DeviceVersionMacMini);
            chipType = ChipTypeM4Pro;
        }
        else if ([model hasPrefix:@"Macmini"]) {
            mutableDic[SDMacDeviceName] = @"Mac mini";
            mutableDic[SDMacVersionEnum] = @(DeviceVersionMacMini);
            chipType = ChipTypeIntel;
        }
        // MacBook Pro (Apple Silicon)
        else if ([model hasPrefix:@"MacBookPro17,"]) {
            mutableDic[SDMacDeviceName] = @"MacBook Pro";
            mutableDic[SDMacVersionEnum] = @(DeviceVersionMacBookPro);
            chipType = ChipTypeM1;
        }
        else if ([model hasPrefix:@"MacBookPro18,1"] || [model hasPrefix:@"MacBookPro18,2"]) {
            mutableDic[SDMacDeviceName] = @"MacBook Pro";
            mutableDic[SDMacVersionEnum] = @(DeviceVersionMacBookPro);
            chipType = ([model hasPrefix:@"MacBookPro18,2"]) ? ChipTypeM1Max : ChipTypeM1Pro;
        }
        else if ([model hasPrefix:@"MacBookPro18,3"] || [model hasPrefix:@"MacBookPro18,4"]) {
            mutableDic[SDMacDeviceName] = @"MacBook Pro";
            mutableDic[SDMacVersionEnum] = @(DeviceVersionMacBookPro);
            chipType = ([model hasPrefix:@"MacBookPro18,4"]) ? ChipTypeM1Max : ChipTypeM1Pro;
        }
        else if ([model hasPrefix:@"Mac14,7"]) {
            mutableDic[SDMacDeviceName] = @"MacBook Pro";
            mutableDic[SDMacVersionEnum] = @(DeviceVersionMacBookPro);
            chipType = ChipTypeM2;
        }
        else if ([model hasPrefix:@"Mac14,5"] || [model hasPrefix:@"Mac14,6"]) {
            mutableDic[SDMacDeviceName] = @"MacBook Pro";
            mutableDic[SDMacVersionEnum] = @(DeviceVersionMacBookPro);
            chipType = ChipTypeM2Max;
        }
        else if ([model hasPrefix:@"Mac14,9"] || [model hasPrefix:@"Mac14,10"]) {
            mutableDic[SDMacDeviceName] = @"MacBook Pro";
            mutableDic[SDMacVersionEnum] = @(DeviceVersionMacBookPro);
            chipType = ChipTypeM2Pro;
        }
        else if ([model hasPrefix:@"Mac15,3"]) {
            mutableDic[SDMacDeviceName] = @"MacBook Pro";
            mutableDic[SDMacVersionEnum] = @(DeviceVersionMacBookPro);
            chipType = ChipTypeM3;
        }
        else if ([model hasPrefix:@"Mac15,6"] || [model hasPrefix:@"Mac15,7"]) {
            mutableDic[SDMacDeviceName] = @"MacBook Pro";
            mutableDic[SDMacVersionEnum] = @(DeviceVersionMacBookPro);
            chipType = ChipTypeM3Pro;
        }
        else if ([model hasPrefix:@"Mac15,8"] || [model hasPrefix:@"Mac15,9"] ||
                 [model hasPrefix:@"Mac15,10"] || [model hasPrefix:@"Mac15,11"]) {
            mutableDic[SDMacDeviceName] = @"MacBook Pro";
            mutableDic[SDMacVersionEnum] = @(DeviceVersionMacBookPro);
            chipType = ChipTypeM3Max;
        }
        else if ([model hasPrefix:@"Mac16,1"]) {
            mutableDic[SDMacDeviceName] = @"MacBook Pro";
            mutableDic[SDMacVersionEnum] = @(DeviceVersionMacBookPro);
            chipType = ChipTypeM4;
        }
        else if ([model hasPrefix:@"Mac16,7"] || [model hasPrefix:@"Mac16,8"]) {
            mutableDic[SDMacDeviceName] = @"MacBook Pro";
            mutableDic[SDMacVersionEnum] = @(DeviceVersionMacBookPro);
            chipType = ChipTypeM4Pro;
        }
        else if ([model hasPrefix:@"Mac16,5"] || [model hasPrefix:@"Mac16,6"]) {
            mutableDic[SDMacDeviceName] = @"MacBook Pro";
            mutableDic[SDMacVersionEnum] = @(DeviceVersionMacBookPro);
            chipType = ChipTypeM4Max;
        }
        else if ([model hasPrefix:@"MacBookPro"]) {
            mutableDic[SDMacDeviceName] = @"MacBook Pro";
            mutableDic[SDMacVersionEnum] = @(DeviceVersionMacBookPro);
            chipType = ChipTypeIntel;
        }
        // MacBook Air (Apple Silicon)
        else if ([model hasPrefix:@"MacBookAir10,"]) {
            mutableDic[SDMacDeviceName] = @"MacBook Air";
            mutableDic[SDMacVersionEnum] = @(DeviceVersionMacBookAir);
            chipType = ChipTypeM1;
        }
        else if ([model hasPrefix:@"Mac14,2"]) {
            mutableDic[SDMacDeviceName] = @"MacBook Air";
            mutableDic[SDMacVersionEnum] = @(DeviceVersionMacBookAir);
            chipType = ChipTypeM2;
        }
        else if ([model hasPrefix:@"Mac14,15"]) {
            mutableDic[SDMacDeviceName] = @"MacBook Air";
            mutableDic[SDMacVersionEnum] = @(DeviceVersionMacBookAir);
            chipType = ChipTypeM2;
        }
        else if ([model hasPrefix:@"Mac15,12"]) {
            mutableDic[SDMacDeviceName] = @"MacBook Air";
            mutableDic[SDMacVersionEnum] = @(DeviceVersionMacBookAir);
            chipType = ChipTypeM3;
        }
        else if ([model hasPrefix:@"Mac15,13"]) {
            mutableDic[SDMacDeviceName] = @"MacBook Air";
            mutableDic[SDMacVersionEnum] = @(DeviceVersionMacBookAir);
            chipType = ChipTypeM3;
        }
        else if ([model hasPrefix:@"MacBookAir"]) {
            mutableDic[SDMacDeviceName] = @"MacBook Air";
            mutableDic[SDMacVersionEnum] = @(DeviceVersionMacBookAir);
            chipType = ChipTypeIntel;
        }
        // MacBook
        else if ([model hasPrefix:@"MacBook"]) {
            mutableDic[SDMacDeviceName] = @"MacBook";
            mutableDic[SDMacVersionEnum] = @(DeviceVersionMacBook);
            chipType = ChipTypeIntel;
        }
        // Xserve
        else if ([model hasPrefix:@"Xserve"]) {
            mutableDic[SDMacDeviceName] = @"Xserve";
            mutableDic[SDMacVersionEnum] = @(DeviceVersionXserve);
            chipType = ChipTypeIntel;
        }
        else {
            mutableDic[SDMacDeviceName] = @"Unknown";
            mutableDic[SDMacVersionEnum] = @(DeviceVersionUnknown);
        }

        mutableDic[SDMacChipType] = @(chipType);

        // Check if screen is retina
        float displayScale = 1.0;
        if ([[NSScreen mainScreen] respondsToSelector:@selector(backingScaleFactor)]) {
            for (NSScreen *screen in [NSScreen screens]) {
                float s = [screen backingScaleFactor];
                if (s > displayScale)
                    displayScale = s;
            }
        }
        if (displayScale == 1)
            mutableDic[SDMacResolution] = @(DeviceScreenNoRetina);
        else if (displayScale >= 2)
            mutableDic[SDMacResolution] = @(DeviceScreenRetina);
        else
            mutableDic[SDMacResolution] = @(UnknownResolution);

        // Get device size in inches
        mutableDic[SDMacScreenSize] = [self deviceSizeInInches];

        // Copy to static dictionary
        deviceDic = [mutableDic copy];
    });

    return deviceDic;
}

+ (NSString *)currentModel {
    size_t len = 0;
    sysctlbyname("hw.model", NULL, &len, NULL, 0);
    NSString *model;
    if (len) {
        char *modelChar = malloc(len*sizeof(char));
        sysctlbyname("hw.model", modelChar, &len, NULL, 0);
        model = [NSString stringWithUTF8String:modelChar];
        free(modelChar);
    }
    return model;
}

#pragma mark - Mac Information

+ (DeviceVersion)deviceVersion {
    return [[[self deviceInformationForModel:[self currentModel]] objectForKey:SDMacVersionEnum] integerValue];
}

+ (DeviceSize)deviceSize {
    return [[[self deviceInformationForModel:[self currentModel]] objectForKey:SDMacScreenSize] integerValue];
}

+ (NSString *)deviceSizeName:(DeviceSize)deviceSize
{
    return @{
        @(UnknownSize)   : @"Unknown Size",
        @(Mac27Inch)     : @"27 inch",
        @(Mac24Inch)     : @"24 inch",
        @(Mac21Dot5Inch) : @"21.5 inch",
        @(Mac20Inch)     : @"20 inch",
        @(Mac17Inch)     : @"17 inch",
        @(Mac16Inch)     : @"16 inch",
        @(Mac15Inch)     : @"15 inch",
        @(Mac14Inch)     : @"14 inch",
        @(Mac13Inch)     : @"13 inch",
        @(Mac12Inch)     : @"12 inch",
        @(Mac11Inch)     : @"11 inch"
    }[@(deviceSize)];
}

+ (DeviceScreenResolution)deviceScreenResolution {
    return [[[self deviceInformationForModel:[self currentModel]] objectForKey:SDMacResolution] integerValue];
}

+ (NSString *)deviceScreenResolutionName:(DeviceScreenResolution)deviceScreenResolution
{
    return @{
        @(UnknownResolution)    : @"Unknown resolution",
        @(DeviceScreenRetina)   : @"Retina screen",
        @(DeviceScreenNoRetina) : @"Non-retina screen"
    }[@(deviceScreenResolution)];
}

+ (NSString *)deviceVersionString {
    return [[self deviceInformationForModel:[self currentModel]] objectForKey:SDMacDeviceName];
}

+ (NSSize)deviceScreenResolutionPixelSize {
    NSScreen *screen = [NSScreen mainScreen];
    NSDictionary *description = [screen deviceDescription];
    NSSize pixelSize = [[description objectForKey:NSDeviceSize] sizeValue];

    // Double pixel size if retina screen
    if ([[[self deviceInformationForModel:[self currentModel]] objectForKey:SDMacResolution] integerValue] == DeviceScreenRetina)
        return NSMakeSize(pixelSize.width*2, pixelSize.height*2);
    return pixelSize;
}

+ (BOOL)isAppleSilicon {
    ChipType chip = [self chipType];
    return chip != ChipTypeIntel && chip != ChipTypeUnknown;
}

+ (ChipType)chipType {
    return [[[self deviceInformationForModel:[self currentModel]] objectForKey:SDMacChipType] integerValue];
}

+ (NSString *)chipName {
    ChipType chip = [self chipType];
    return @{
        @(ChipTypeUnknown) : @"Unknown",
        @(ChipTypeIntel)   : @"Intel",
        @(ChipTypeM1)      : @"Apple M1",
        @(ChipTypeM1Pro)   : @"Apple M1 Pro",
        @(ChipTypeM1Max)   : @"Apple M1 Max",
        @(ChipTypeM1Ultra) : @"Apple M1 Ultra",
        @(ChipTypeM2)      : @"Apple M2",
        @(ChipTypeM2Pro)   : @"Apple M2 Pro",
        @(ChipTypeM2Max)   : @"Apple M2 Max",
        @(ChipTypeM2Ultra) : @"Apple M2 Ultra",
        @(ChipTypeM3)      : @"Apple M3",
        @(ChipTypeM3Pro)   : @"Apple M3 Pro",
        @(ChipTypeM3Max)   : @"Apple M3 Max",
        @(ChipTypeM4)      : @"Apple M4",
        @(ChipTypeM4Pro)   : @"Apple M4 Pro",
        @(ChipTypeM4Max)   : @"Apple M4 Max"
    }[@(chip)];
}

+ (BOOL)versionEqualTo:(NSString *)version
{
    return ([[@([[NSProcessInfo processInfo]operatingSystemVersion].minorVersion) stringValue] compare:version options:NSNumericSearch] == NSOrderedSame);
}

+ (BOOL)versionGreaterThan:(NSString *)version
{
    return ([[@([[NSProcessInfo processInfo]operatingSystemVersion].minorVersion) stringValue] compare:version options:NSNumericSearch] == NSOrderedDescending);
}

+ (BOOL)versionGreaterThanOrEqualTo:(NSString *)version
{
    return ([[@([[NSProcessInfo processInfo]operatingSystemVersion].minorVersion) stringValue] compare:version options:NSNumericSearch] != NSOrderedAscending);
}

+ (BOOL)versionLessThan:(NSString *)version
{
    return ([[@([[NSProcessInfo processInfo]operatingSystemVersion].minorVersion) stringValue] compare:version options:NSNumericSearch] == NSOrderedAscending);
}

+ (BOOL)versionLessThanOrEqualTo:(NSString *)version
{
    return ([[@([[NSProcessInfo processInfo]operatingSystemVersion].minorVersion) stringValue] compare:version options:NSNumericSearch] != NSOrderedDescending);
}

#pragma mark - Helpers

+ (NSNumber *)deviceSizeInInches {
    NSScreen *screen           = [NSScreen mainScreen];
    NSDictionary *description  = [screen deviceDescription];
    CGSize displayPhysicalSize = CGDisplayScreenSize([[description objectForKey:@"NSScreenNumber"] unsignedIntValue]);
    CGFloat sizeInInches       = floor(sqrt(pow(displayPhysicalSize.width, 2) + pow(displayPhysicalSize.height, 2)) * 0.0393701);

    if (sizeInInches == 11)
        return @(Mac11Inch);
    else if (sizeInInches == 12)
        return @(Mac12Inch);
    else if (sizeInInches == 13)
        return @(Mac13Inch);
    else if (sizeInInches == 14)
        return @(Mac14Inch);
    else if (sizeInInches == 15)
        return @(Mac15Inch);
    else if (sizeInInches == 16)
        return @(Mac16Inch);
    else if (sizeInInches == 17)
        return @(Mac17Inch);
    else if (sizeInInches == 20)
        return @(Mac20Inch);
    else if (sizeInInches == 21)
        return @(Mac21Dot5Inch);
    else if (sizeInInches == 24)
        return @(Mac24Inch);
    else if (sizeInInches == 27)
        return @(Mac27Inch);
    else
        return @(UnknownSize);
}

@end
