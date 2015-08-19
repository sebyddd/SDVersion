//
//  SDMacVersion.m
//  SDMacVersion
//
//  Copyright (c) 2015 Sebastian Dobrincu & Tom Baranes. All rights reserved.
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

#pragma mark - Models

+ (NSDictionary *)deviceInformationForModel:(NSString *)model {

	__block NSMutableDictionary *mutableDic = [NSMutableDictionary dictionary];
    static NSDictionary *deviceDic = nil;
    static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		if ([model hasPrefix:@"MacPro"])
        {
			mutableDic[SDMacDeviceName] = @"MacPro";
            mutableDic[SDMacVersionEnum] = @(DeviceVersionMacPro);
		}
        
        else if ([model hasPrefix:@"iMac"])
        {
            mutableDic[SDMacDeviceName] = @"iMac";
            mutableDic[SDMacVersionEnum] = @(DeviceVersionIMac);
		}
        
        else if ([model hasPrefix:@"MacBookPro"])
        {
            mutableDic[SDMacDeviceName] = @"MacBookPro";
            mutableDic[SDMacVersionEnum] = @(DeviceVersionMacBookPro);
        }
        
        else if ([model hasPrefix:@"MacBookAir"])
        {
            mutableDic[SDMacDeviceName] = @"MacBookAir";
            mutableDic[SDMacVersionEnum] = @(DeviceVersionMacBookAir);
		}
        
        else if ([model hasPrefix:@"MacBook"])
        {
            mutableDic[SDMacDeviceName] = @"MacBook";
            mutableDic[SDMacVersionEnum] = @(DeviceVersionMacBook);
		}
        
        else
        {
            mutableDic[SDMacDeviceName] = @"Unknown";
            mutableDic[SDMacVersionEnum] = @(DeviceVersionUnknown);
        }
        
        // Check if screen is retina
        float displayScale = 1.0;
        if ([[NSScreen mainScreen] respondsToSelector:@selector(backingScaleFactor)])
            for (NSScreen *screen in [NSScreen screens]) {
                float s = [screen backingScaleFactor];
                if (s > displayScale)
                    displayScale = s;}
        if (displayScale == 1)
            mutableDic[SDMacResolution] = @(DeviceScreenNoRetina);
        else if (displayScale == 2)
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

+ (DeviceScreenResolution)deviceScreenResolution {
	return [[[self deviceInformationForModel:[self currentModel]] objectForKey:SDMacResolution] integerValue];
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
    else if (sizeInInches == 15)
        return @(Mac15Inch);
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
