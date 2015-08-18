//
//  SDMacVersion.m
//  SDiPhoneVersion
//
//  Created by Tom Baranes on 17/08/15.
//  Copyright (c) 2015 Sebastian Dobrincu. All rights reserved.
//

#include <stdlib.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/sysctl.h>
#import "SDMacVersion.h"

@implementation SDMacVersion

static NSString * const SDMacDeviceName = @"SDMacDeviceName";
static NSString * const SDMacYear = @"SDMacReleaseYear";
static NSString * const SDMacVersionEnum = @"SDMacVersionEnum";
static NSString * const SDMacScreenSize = @"SDMacReleaseSize";
static NSString * const SDMacResolution = @"SDMacResolution";

#pragma mark - Models

+ (NSDictionary *)dicOfMacPro {
	// https://support.apple.com/fr-fr/HT202888
	return @{@"model": @{SDMacDeviceName: @"", SDMacVersionEnum: @(DeviceVersionMacPro), SDMacYear: @"", SDMacScreenSize: @(UnknownSize), SDMacResolution: @(DeviceScreenRetina)}};
}

+ (NSDictionary *)dicOfIMac {
	// https://support.apple.com/fr-fr/HT201634
	return @{@"model": @{SDMacDeviceName: @"", SDMacVersionEnum: @(DeviceVersionIMac), SDMacYear: @"", SDMacScreenSize: @(Mac20Inch), SDMacResolution: @(DeviceScreenRetina)}};
}

+ (NSDictionary *)dicOfMacBookPro {
	//https://support.apple.com/fr-fr/HT201300
	return @{@"model": @{SDMacDeviceName: @"", SDMacVersionEnum: @(DeviceVersionMacBookPro), SDMacYear: @"", SDMacScreenSize: @(Mac20Inch), SDMacResolution: @(DeviceScreenRetina)}};
}

+ (NSDictionary *)dicOfMacBookAir {
	//	https://support.apple.com/fr-fr/HT201862
	return @{@"model": @{SDMacDeviceName: @"", SDMacVersionEnum: @(DeviceVersionMacBookAir), SDMacYear: @"", SDMacScreenSize: @(Mac20Inch), SDMacResolution: @(DeviceScreenRetina)}};
}

+ (NSDictionary *)dicOfMacBook {
	//	https://support.apple.com/fr-fr/HT201608
	return @{@"model": @{SDMacDeviceName: @"", SDMacVersionEnum: @(DeviceVersionMacBook), SDMacYear: @"", SDMacScreenSize: @(Mac20Inch), SDMacResolution: @(DeviceScreenRetina)}};
}

+ (NSDictionary *)unknownMac {
	return @{@"model": @{SDMacDeviceName: @"", SDMacVersionEnum: @(DeviceVersionUnknown), SDMacYear: @"", SDMacScreenSize: @(UnknownSize), SDMacResolution: @(UnknownResolution)}};
}


+ (NSDictionary *)deviceInformationForModel:(NSString *)model {
	static NSDictionary *deviceDic = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		if ([model hasPrefix:@"MacBookPro"]) {
			deviceDic = [self dicOfMacBookPro];
		} else if ([model hasPrefix:@"iMac"]) {
			deviceDic = [self dicOfIMac];
		} else if ([model hasPrefix:@"MacPro"]) {
			deviceDic = [self dicOfMacPro];
		} else if ([model hasPrefix:@"MacBookAir"]) {
			deviceDic = [self dicOfMacBookAir];
		} else if ([model hasPrefix:@"MacBook"]) {
			deviceDic = [self dicOfMacBook];
		} else {
			
		}
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

#pragma mark - Mac information

+ (DeviceVersion)deviceVersion {
	return [[[self deviceInformationForModel:[self currentModel]] objectForKey:SDMacVersionEnum] integerValue];
}

+ (NSString *)deviceName {
	return [[self deviceInformationForModel:[self currentModel]] objectForKey:SDMacDeviceName];
}

+ (DeviceReleaseYear)deviceReleaseYear {
	return [[[self deviceInformationForModel:[self currentModel]] objectForKey:SDMacYear] integerValue];
}

+ (DeviceSize)deviceSize {
	return [[[self deviceInformationForModel:[self currentModel]] objectForKey:SDMacScreenSize] integerValue];
}

+ (DeviceScreenResolution)deviceScreenResolution {
	return [[[self deviceInformationForModel:[self currentModel]] objectForKey:SDMacResolution] integerValue];
}

+ (NSSize)deviceResolutionPixelSize {
	NSScreen *screen = [NSScreen mainScreen];
	NSDictionary *description = [screen deviceDescription];
	NSSize displayPixelSize = [[description objectForKey:NSDeviceSize] sizeValue];
	return displayPixelSize;
}

@end
