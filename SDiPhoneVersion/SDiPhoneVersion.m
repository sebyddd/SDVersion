//
//  SDiPhoneVersion.m
//  SDiPhoneVersion
//
//  Created by Sebastian Dobrincu on 09/09/14.
//  Copyright (c) 2014 Sebastian Dobrincu. All rights reserved.
//

#import "SDiPhoneVersion.h"

@implementation SDiPhoneVersion

+(NSDictionary*)deviceNamesByCode {
    
    static NSDictionary* deviceNamesByCode = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        deviceNamesByCode = @{
                              //iPhones
                              @"iPhone3,1" :[NSNumber numberWithInteger:iPhone4],
                              @"iPhone3,3" :[NSNumber numberWithInteger:iPhone4],
                              @"iPhone4,1" :[NSNumber numberWithInteger:iPhone4S],
                              @"iPhone5,1" :[NSNumber numberWithInteger:iPhone5],
                              @"iPhone5,2" :[NSNumber numberWithInteger:iPhone5],
                              @"iPhone5,3" :[NSNumber numberWithInteger:iPhone5C],
                              @"iPhone5,4" :[NSNumber numberWithInteger:iPhone5C],
                              @"iPhone6,1" :[NSNumber numberWithInteger:iPhone5S],
                              @"iPhone6,2" :[NSNumber numberWithInteger:iPhone5S],
                              @"iPhone7,2" :[NSNumber numberWithInteger:iPhone6],
                              @"iPhone7,1" :[NSNumber numberWithInteger:iPhone6Plus],
                              @"i386"      :[NSNumber numberWithInteger:Simulator],
                              @"x86_64"    :[NSNumber numberWithInteger:Simulator],
                              
                              
                              //iPads
                              @"iPad1,1" :[NSNumber numberWithInteger:iPad1],
                              @"iPad2,1" :[NSNumber numberWithInteger:iPad1],
                              @"iPad2,2" :[NSNumber numberWithInteger:iPad1],
                              @"iPad2,3" :[NSNumber numberWithInteger:iPad1],
                              @"iPad2,4" :[NSNumber numberWithInteger:iPad1],
                              @"iPad2,5" :[NSNumber numberWithInteger:iPadMini],
                              @"iPad2,6" :[NSNumber numberWithInteger:iPadMini],
                              @"iPad2,7" :[NSNumber numberWithInteger:iPadMini],
                              @"iPad3,1" :[NSNumber numberWithInteger:iPad3],
                              @"iPad3,2" :[NSNumber numberWithInteger:iPad3],
                              @"iPad3,3" :[NSNumber numberWithInteger:iPad3],
                              @"iPad3,4" :[NSNumber numberWithInteger:iPad4],
                              @"iPad3,5" :[NSNumber numberWithInteger:iPad4],
                              @"iPad3,6" :[NSNumber numberWithInteger:iPad4],
                              @"iPad4,1" :[NSNumber numberWithInteger:iPadAir],
                              @"iPad4,2" :[NSNumber numberWithInteger:iPadAir],
                              @"iPad4,4" :[NSNumber numberWithInteger:iPadMiniRetina],
                              @"iPad4,5" :[NSNumber numberWithInteger:iPadMiniRetina]
                              
                              
                              };
    });
    
    return deviceNamesByCode;
}

+(DeviceVersion)deviceVersion {
    
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *code = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    DeviceVersion version = (DeviceVersion)[[self.deviceNamesByCode objectForKey:code] integerValue];
    
    return version;
    
}

+(DeviceSize)deviceSize {
    
    CGFloat screenHeight=0;

    if (iOSVersionGreaterThan(@"8")) {
        
        UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
        
        if (orientation ==  UIDeviceOrientationPortrait)
            screenHeight = [[UIScreen mainScreen] bounds].size.height;
        
        else if((orientation == UIDeviceOrientationLandscapeRight) || (orientation == UIInterfaceOrientationLandscapeLeft))
            screenHeight = [[UIScreen mainScreen] bounds].size.width;
        
    }else
        screenHeight = [[UIScreen mainScreen] bounds].size.height;
    
    
    if (screenHeight == 480)
        return iPhone35inch;
    else if(screenHeight == 568)
        return iPhone4inch;
    else if(screenHeight == 667)
        return  iPhone47inch;
    else if(screenHeight == 736)
        return iPhone55inch;
    else
        return UnknownSize;
}

+(NSString*)deviceName {
    
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *code = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    if ([code isEqualToString:@"x86_64"] || [code isEqualToString:@"i386"]) {
        code = @"Simulator";
    }
    
    return code;
}

@end
