//
//  SDwatchOSVersion.m
//  SDVersion
//
//  Created by Jeff Kelley on 6/29/16.
//  Copyright © 2016 Sebastian Dobrincu. All rights reserved.
//

#import "SDwatchOSVersion.h"
#import <sys/utsname.h>

@implementation SDwatchOSVersion

+ (NSDictionary*)deviceNamesByCode
{
    static NSDictionary *deviceNamesByCode = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        deviceNamesByCode = @{ @"Watch1,1" : @(AppleWatch38mm),
                               @"Watch1,2" : @(AppleWatch42mm) };
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

+ (DeviceSize)deviceSize
{
    CGFloat screenHeight = CGRectGetHeight([WKInterfaceDevice currentDevice].screenBounds);
    
    if (screenHeight == 195) {
        return Screen42mm;
    } else if(screenHeight == 170) {
        return Screen38mm;
    } else {
        return UnknownSize;
    }
}

+ (NSString*)deviceName
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *code = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    if ([code isEqualToString:@"x86_64"] || [code isEqualToString:@"i386"]) {
        code = @"Simulator";
    }
    
    return code;
}


@end
