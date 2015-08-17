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

static NSString * const SDMacFullModel = @"SDMacFullModel";
static NSString * const SDMacYear = @"SDMacReleaseYear";
static NSString * const SDMacModel = @"SDMacReleaseModel";
static NSString * const SDMacSize = @"SDMacReleaseSize";
static NSString * const SDMacRetina = @"SDMacReleaseRetina";

#pragma mark - Models

+ (NSDictionary *)dicOfMacPro {
	// https://support.apple.com/fr-fr/HT202888
	return @{SDMacFullModel: @"", SDMacModel: @(DeviceVersionMacPro), SDMacYear: @"", SDMacSize: @(UnknownSize), SDMacRetina: @NO};
}

+ (NSDictionary *)dicOfIMac {
	// https://support.apple.com/fr-fr/HT201634
	return @{SDMacFullModel: @"", SDMacModel: @(DeviceVersionIMac), SDMacYear: @"", SDMacSize: @17, SDMacRetina: @NO};
}

+ (NSDictionary *)dicOfMacBookPro {
	//https://support.apple.com/fr-fr/HT201300
	return @{SDMacFullModel: @"", SDMacModel: @(DeviceVersionMacBookPro), SDMacYear: @"", SDMacSize: @17, SDMacRetina: @NO};
}

+ (NSDictionary *)dicOfMacBookAir {
	//	https://support.apple.com/fr-fr/HT201862
	return @{SDMacFullModel: @"", SDMacModel: @(DeviceVersionMacBookAir), SDMacYear: @"", SDMacSize: @17, SDMacRetina: @NO};
}

+ (NSDictionary *)dicOfMacBook {
	//	https://support.apple.com/fr-fr/HT201608
	return @{SDMacFullModel: @"", SDMacModel: @(DeviceVersionMacBook), SDMacYear: @"", SDMacSize: @17, SDMacRetina: @NO};
}

+ (NSDictionary *)unknownMac {
	return @{SDMacFullModel: @"", SDMacModel: @(DeviceVersionUnknown), SDMacYear: @"", SDMacSize: @(UnknownSize), SDMacRetina: @NO};
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
	return [[[self deviceInformationForModel:[self currentModel]] objectForKey:SDMacModel] integerValue];
}

+ (DeviceReleaseYear)DeviceReleaseYear {
	return [[[self deviceInformationForModel:[self currentModel]] objectForKey:SDMacYear] integerValue];
}

+ (DeviceSize)deviceSize {
	return [[[self deviceInformationForModel:[self currentModel]] objectForKey:SDMacSize] integerValue];
}

+ (NSString *)deviceName {
	return [[self deviceInformationForModel:[self currentModel]] objectForKey:SDMacFullModel];
}

+ (BOOL)isDeviceRetina {
	return [[[self deviceInformationForModel:[self currentModel]] objectForKey:SDMacRetina] boolValue];
}

@end
