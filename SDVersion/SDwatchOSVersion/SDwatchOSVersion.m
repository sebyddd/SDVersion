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
                              @"Watch4,1" : @(AppleWatch40mmSeries4),
                              @"Watch4,2" : @(AppleWatch44mmSeries4),
                              @"Watch4,3" : @(AppleWatch40mmSeries4),
                              @"Watch4,4" : @(AppleWatch44mmSeries4),
                              @"Watch5,3" : @(AppleWatch40mmSeries5),
                              @"Watch5,4" : @(AppleWatch44mmSeries5),
                              @"Watch5,9" : @(AppleWatch40mmSE),
                              @"Watch5,12" : @(AppleWatch44mmSE),
                              @"Watch6,1" : @(AppleWatch40mmSeries6),
                              @"Watch6,2" : @(AppleWatch44mmSeries6),
                              @"Watch6,6" : @(AppleWatch41mmSeries7),
                              @"Watch6,9" : @(AppleWatch45mmSeries7),
                              @"Watch6,13" : @(AppleWatch40mmSE2),
                              @"Watch6,13" : @(AppleWatch44mmSE2),
                              @"Watch6,14" : @(AppleWatch41mmSeries8),
                              @"Watch6,15" : @(AppleWatch45mmSeries8),
                              @"Watch6,18" : @(AppleWatch49mmUltra),
                              };
    });
    
    return deviceNamesByCode;
}

+ (DeviceVersion)deviceVersion
{
    NSString *code = nil;
    
#if TARGET_OS_SIMULATOR
    code = NSProcessInfo.processInfo.environment[@"SIMULATOR_MODEL_IDENTIFIER"];
#endif // TARGET_OS_SIMULATOR
    
    if (code == nil) {
        struct utsname systemInfo;
        uname(&systemInfo);
        code = [NSString stringWithCString:systemInfo.machine
                                  encoding:NSUTF8StringEncoding];
    }
    
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
             @(AppleWatch40mmSeries4) : @"Apple Watch Series 4 40mm",
             @(AppleWatch44mmSeries4) : @"Apple Watch Series 4 44mm",
             @(AppleWatch40mmSeries5) : @"Apple Watch Series 5 40mm",
             @(AppleWatch44mmSeries5) : @"Apple Watch Series 5 44mm",
             @(AppleWatch40mmSE)      : @"Apple Watch Series SE 40mm",
             @(AppleWatch44mmSE)      : @"Apple Watch Series SE 44mm",
             @(AppleWatch40mmSeries6) : @"Apple Watch Series 6 40mm",
             @(AppleWatch44mmSeries6) : @"Apple Watch Series 6 44mm",
             @(AppleWatch41mmSeries7) : @"Apple Watch Series 7 41mm",
             @(AppleWatch45mmSeries7) : @"Apple Watch Series 7 45mm",
             @(AppleWatch40mmSE2)     : @"Apple Watch Series SE2 40mm",
             @(AppleWatch44mmSE2)     : @"Apple Watch Series SE2 44mm",
             @(AppleWatch41mmSeries8) : @"Apple Watch Series 8 41mm",
             @(AppleWatch45mmSeries8) : @"Apple Watch Series 8 45mm",
             @(AppleWatch49mmUltra)   : @"Apple Watch 49mm Ultra",
             @(Simulator)             : @"Simulator"
             }[@(deviceVersion)];
}

+ (DeviceSize)deviceSize
{
    CGFloat screenHeight = CGRectGetHeight([WKInterfaceDevice currentDevice].screenBounds);
    
    if (screenHeight == 224) {
        return Screen44mm;
    } else if (screenHeight == 195) {
        return Screen42mm;
    } else if(screenHeight == 197) {
        return Screen40mm;
    } else if(screenHeight == 170) {
        return Screen38mm;
    } else if(screenHeight == 215) {
        return Screen41mm;
    } else if(screenHeight == 242) {
        return Screen45mm;
    } else if(screenHeight == 251) {
        return Screen49mm;
    } else {
        return UnknownSize;
    }
}

+ (NSString *)deviceSizeName:(DeviceSize)deviceSize
{
    return @{
             @(UnknownSize) : @"Unknown Size",
             @(Screen38mm)  : @"38mm",
             @(Screen40mm)  : @"40mm",
             @(Screen41mm)  : @"41mm",
             @(Screen42mm)  : @"42mm",
             @(Screen44mm)  : @"44mm",
             @(Screen45mm)  : @"45mm",
             @(Screen49mm)  : @"49mm"
             }[@(deviceSize)];
}

+ (NSString *)deviceName
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *code = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    if ([code isEqualToString:@"x86_64"] || [code isEqualToString:@"i386"]) {
        code = [NSString stringWithFormat:@"%@ Simulator", code];
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
