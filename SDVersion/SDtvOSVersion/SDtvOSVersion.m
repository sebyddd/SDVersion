//
//  SDtvOSVersion.m
//  SDVersion
//
//  Copyright (c) 2016-2025 Sebastian Dobrincu. All rights reserved.
//

#import "SDtvOSVersion.h"

#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>
#import <sys/utsname.h>

@implementation SDtvOSVersion

+ (NSDictionary*)deviceNamesByCode
{
    static NSDictionary *deviceNamesByCode = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        deviceNamesByCode = @{
            // Simulators
            @"i386"       : @(Simulator),
            @"x86_64"     : @(Simulator),
            @"arm64"      : @(Simulator),

            // Apple TV HD (4th Generation)
            @"AppleTV5,3" : @(AppleTVHD),

            // Apple TV 4K (1st Generation)
            @"AppleTV6,2" : @(AppleTV4K1stGen),

            // Apple TV 4K (2nd Generation)
            @"AppleTV11,1" : @(AppleTV4K2ndGen),

            // Apple TV 4K (3rd Generation)
            @"AppleTV14,1" : @(AppleTV4K3rdGen)
        };
    });

    return deviceNamesByCode;
}

+ (DeviceVersion)deviceVersion
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *code = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];

    DeviceVersion version = (DeviceVersion)[[self.deviceNamesByCode objectForKey:code] integerValue];

    return version;
}

+ (NSString *)deviceVersionName:(DeviceVersion)deviceVersion
{
    return @{
        @(AppleTVHD)       : @"Apple TV HD",
        @(AppleTV4K1stGen) : @"Apple TV 4K (1st generation)",
        @(AppleTV4K2ndGen) : @"Apple TV 4K (2nd generation)",
        @(AppleTV4K3rdGen) : @"Apple TV 4K (3rd generation)",
        @(Simulator)       : @"Simulator"
    }[@(deviceVersion)];
}

+ (NSString *)deviceName
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *code = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    if ([code isEqualToString:@"x86_64"] || [code isEqualToString:@"i386"] || [code isEqualToString:@"arm64"]) {
        code = @"Simulator";
    }

    return code;
}

+ (BOOL)versionEqualTo:(NSString *)version
{
    return ([[[UIDevice currentDevice] systemVersion] compare:version options:NSNumericSearch] == NSOrderedSame);
}

+ (BOOL)versionGreaterThan:(NSString *)version
{
    return ([[[UIDevice currentDevice] systemVersion] compare:version options:NSNumericSearch] == NSOrderedDescending);
}

+ (BOOL)versionGreaterThanOrEqualTo:(NSString *)version
{
    return ([[[UIDevice currentDevice] systemVersion] compare:version options:NSNumericSearch] != NSOrderedAscending);
}

+ (BOOL)versionLessThan:(NSString *)version
{
    return ([[[UIDevice currentDevice] systemVersion] compare:version options:NSNumericSearch] == NSOrderedAscending);
}

+ (BOOL)versionLessThanOrEqualTo:(NSString *)version
{
    return ([[[UIDevice currentDevice] systemVersion] compare:version options:NSNumericSearch] != NSOrderedDescending);
}

@end
