//
//  SDwatchOSVersion.m
//  SDVersion
//
//  Copyright (c) 2016-2025 Sebastian Dobrincu. All rights reserved.
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
            // Simulators
            @"i386"    : @(Simulator),
            @"x86_64"  : @(Simulator),
            @"arm64"   : @(Simulator),

            // Original
            @"Watch1,1" : @(AppleWatch38mm),
            @"Watch1,2" : @(AppleWatch42mm),

            // Series 1
            @"Watch2,6" : @(AppleWatch38mmSeries1),
            @"Watch2,7" : @(AppleWatch42mmSeries1),

            // Series 2
            @"Watch2,3" : @(AppleWatch38mmSeries2),
            @"Watch2,4" : @(AppleWatch42mmSeries2),

            // Series 3
            @"Watch3,1" : @(AppleWatch38mmSeries3),
            @"Watch3,2" : @(AppleWatch42mmSeries3),
            @"Watch3,3" : @(AppleWatch38mmSeries3),
            @"Watch3,4" : @(AppleWatch42mmSeries3),

            // Series 4
            @"Watch4,1" : @(AppleWatch40mmSeries4),
            @"Watch4,2" : @(AppleWatch44mmSeries4),
            @"Watch4,3" : @(AppleWatch40mmSeries4),
            @"Watch4,4" : @(AppleWatch44mmSeries4),

            // Series 5
            @"Watch5,1" : @(AppleWatch40mmSeries5),
            @"Watch5,2" : @(AppleWatch44mmSeries5),
            @"Watch5,3" : @(AppleWatch40mmSeries5),
            @"Watch5,4" : @(AppleWatch44mmSeries5),

            // SE 1st Gen
            @"Watch5,9"  : @(AppleWatchSE40mm),
            @"Watch5,10" : @(AppleWatchSE44mm),
            @"Watch5,11" : @(AppleWatchSE40mm),
            @"Watch5,12" : @(AppleWatchSE44mm),

            // Series 6
            @"Watch6,1" : @(AppleWatch40mmSeries6),
            @"Watch6,2" : @(AppleWatch44mmSeries6),
            @"Watch6,3" : @(AppleWatch40mmSeries6),
            @"Watch6,4" : @(AppleWatch44mmSeries6),

            // Series 7
            @"Watch6,6" : @(AppleWatch41mmSeries7),
            @"Watch6,7" : @(AppleWatch45mmSeries7),
            @"Watch6,8" : @(AppleWatch41mmSeries7),
            @"Watch6,9" : @(AppleWatch45mmSeries7),

            // SE 2nd Gen
            @"Watch6,10" : @(AppleWatchSE2_40mm),
            @"Watch6,11" : @(AppleWatchSE2_44mm),
            @"Watch6,12" : @(AppleWatchSE2_40mm),
            @"Watch6,13" : @(AppleWatchSE2_44mm),

            // Series 8
            @"Watch6,14" : @(AppleWatch41mmSeries8),
            @"Watch6,15" : @(AppleWatch45mmSeries8),
            @"Watch6,16" : @(AppleWatch41mmSeries8),
            @"Watch6,17" : @(AppleWatch45mmSeries8),

            // Ultra
            @"Watch6,18" : @(AppleWatchUltra49mm),

            // Series 9
            @"Watch7,1" : @(AppleWatch41mmSeries9),
            @"Watch7,2" : @(AppleWatch45mmSeries9),
            @"Watch7,3" : @(AppleWatch41mmSeries9),
            @"Watch7,4" : @(AppleWatch45mmSeries9),

            // Ultra 2
            @"Watch7,5" : @(AppleWatchUltra2_49mm),

            // Series 10
            @"Watch7,8"  : @(AppleWatch42mmSeries10),
            @"Watch7,9"  : @(AppleWatch46mmSeries10),
            @"Watch7,10" : @(AppleWatch42mmSeries10),
            @"Watch7,11" : @(AppleWatch46mmSeries10)
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
        @(AppleWatch38mmSeries1) : @"Apple Watch Series 1 (38mm)",
        @(AppleWatch42mmSeries1) : @"Apple Watch Series 1 (42mm)",
        @(AppleWatch38mmSeries2) : @"Apple Watch Series 2 (38mm)",
        @(AppleWatch42mmSeries2) : @"Apple Watch Series 2 (42mm)",
        @(AppleWatch38mmSeries3) : @"Apple Watch Series 3 (38mm)",
        @(AppleWatch42mmSeries3) : @"Apple Watch Series 3 (42mm)",
        @(AppleWatch40mmSeries4) : @"Apple Watch Series 4 (40mm)",
        @(AppleWatch44mmSeries4) : @"Apple Watch Series 4 (44mm)",
        @(AppleWatch40mmSeries5) : @"Apple Watch Series 5 (40mm)",
        @(AppleWatch44mmSeries5) : @"Apple Watch Series 5 (44mm)",
        @(AppleWatchSE40mm)      : @"Apple Watch SE (40mm)",
        @(AppleWatchSE44mm)      : @"Apple Watch SE (44mm)",
        @(AppleWatch40mmSeries6) : @"Apple Watch Series 6 (40mm)",
        @(AppleWatch44mmSeries6) : @"Apple Watch Series 6 (44mm)",
        @(AppleWatch41mmSeries7) : @"Apple Watch Series 7 (41mm)",
        @(AppleWatch45mmSeries7) : @"Apple Watch Series 7 (45mm)",
        @(AppleWatchSE2_40mm)    : @"Apple Watch SE (2nd generation, 40mm)",
        @(AppleWatchSE2_44mm)    : @"Apple Watch SE (2nd generation, 44mm)",
        @(AppleWatch41mmSeries8) : @"Apple Watch Series 8 (41mm)",
        @(AppleWatch45mmSeries8) : @"Apple Watch Series 8 (45mm)",
        @(AppleWatchUltra49mm)   : @"Apple Watch Ultra (49mm)",
        @(AppleWatch41mmSeries9) : @"Apple Watch Series 9 (41mm)",
        @(AppleWatch45mmSeries9) : @"Apple Watch Series 9 (45mm)",
        @(AppleWatchUltra2_49mm) : @"Apple Watch Ultra 2 (49mm)",
        @(AppleWatch42mmSeries10): @"Apple Watch Series 10 (42mm)",
        @(AppleWatch46mmSeries10): @"Apple Watch Series 10 (46mm)",
        @(Simulator)             : @"Simulator"
    }[@(deviceVersion)];
}

+ (DeviceSize)deviceSize
{
    CGFloat screenHeight = CGRectGetHeight([WKInterfaceDevice currentDevice].screenBounds);

    // Screen heights for different watch sizes
    if (screenHeight == 170) {
        return Screen38mm;
    } else if (screenHeight == 195) {
        return Screen42mm;
    } else if (screenHeight == 197) {
        return Screen40mm;
    } else if (screenHeight == 205) {
        return Screen41mm;
    } else if (screenHeight == 215) {
        return Screen44mm;
    } else if (screenHeight == 224) {
        return Screen45mm;
    } else if (screenHeight == 227) {
        return Screen46mm;
    } else if (screenHeight == 242 || screenHeight == 251) {
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
        @(Screen46mm)  : @"46mm",
        @(Screen49mm)  : @"49mm"
    }[@(deviceSize)];
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
