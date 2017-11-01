//
//  SDwatchOSVersion.m
//  SDVersion
//
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
        deviceNamesByCode = @{
                              @"Watch1,1" : @(AppleWatch38mm),
                              @"Watch1,2" : @(AppleWatch42mm),
                              @"Watch2,6" : @(AppleWatch38mmSeries1),
                              @"Watch2,7" : @(AppleWatch42mmSeries1),
                              @"Watch2,3" : @(AppleWatch38mmSeries2),
                              @"Watch2,4" : @(AppleWatch42mmSeries2),
                              @"Watch3,1" : @(AppleWatch38mmSeries3),
                              @"Watch3,2" : @(AppleWatch42mmSeries3),
                              @"Watch3,3" : @(AppleWatch38mmSeries3),
                              @"Watch3,4" : @(AppleWatch42mmSeries3),
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
             @(AppleWatch38mm)        : @"Apple Watch 38mm",
             @(AppleWatch42mm)        : @"Apple Watch 42mm",
             @(AppleWatch38mmSeries1) : @"Apple Watch Series 1 38mm",
             @(AppleWatch42mmSeries1) : @"Apple Watch Series 1 42mm",
             @(AppleWatch38mmSeries2) : @"Apple Watch Series 2 38mm",
             @(AppleWatch42mmSeries2) : @"Apple Watch Series 2 42mm",
             @(AppleWatch38mmSeries3) : @"Apple Watch Series 3 38mm",
             @(AppleWatch42mmSeries3) : @"Apple Watch Series 3 42mm",
             @(Simulator)             : @"Simulator"
             }[@(deviceVersion)];
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

+ (NSString *)deviceSizeName:(DeviceSize)deviceSize
{
    return @{
             @(UnknownSize) : @"Unknown Size",
             @(Screen38mm)  : @"38mm",
             @(Screen42mm)  : @"42mm"
             }[@(deviceSize)];
}

+ (NSString *)deviceName
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *code = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    if ([code isEqualToString:@"x86_64"] || [code isEqualToString:@"i386"]) {
        code = @"Simulator";
    }
    
    return code;
}

+ (BOOL)versionEqualTo:(NSString *)version
{
    return ([[[WKInterfaceDevice currentDevice] systemVersion] compare:version options:NSNumericSearch] == NSOrderedSame);
}

+ (BOOL)versionGreaterThan:(NSString *)version
{
    return ([[[WKInterfaceDevice currentDevice] systemVersion] compare:version options:NSNumericSearch] == NSOrderedDescending);
}

+ (BOOL)versionGreaterThanOrEqualTo:(NSString *)version
{
    return ([[[WKInterfaceDevice currentDevice] systemVersion] compare:version options:NSNumericSearch] != NSOrderedAscending);
}

+ (BOOL)versionLessThan:(NSString *)version
{
    return ([[[WKInterfaceDevice currentDevice] systemVersion] compare:version options:NSNumericSearch] == NSOrderedAscending);
}

+ (BOOL)versionLessThanOrEqualTo:(NSString *)version
{
    return ([[[WKInterfaceDevice currentDevice] systemVersion] compare:version options:NSNumericSearch] != NSOrderedDescending);
}

@end
