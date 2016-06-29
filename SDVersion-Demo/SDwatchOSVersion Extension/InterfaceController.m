//
//  InterfaceController.m
//  SDwatchOSVersion Extension
//
//  Created by Jeff Kelley on 6/29/16.
//  Copyright © 2016 Sebastian Dobrincu. All rights reserved.
//

#import "InterfaceController.h"

#import "SDwatchOSVersion.h"

@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Get device name as NSString
    [self.watchVersionLabel setText:[@"Watch Version: " stringByAppendingString:DeviceVersionNames[[SDwatchOSVersion deviceVersion]]]];
    
    // Get device size using string conversion
    [self.watchSizeLabel setText:[@"Watch Size: " stringByAppendingString:DeviceSizeNames[[SDwatchOSVersion deviceSize]]]];
    
    if ([SDwatchOSVersion deviceVersion] == AppleWatch42mm)
        NSLog(@"You got the Apple Watch 42mm. Nice!");
    else if ([SDwatchOSVersion deviceVersion] == AppleWatch38mm)
        NSLog(@"You got the Apple Watch 38mm. Good device!");
    
    // Check for device screen size
    if ([SDwatchOSVersion deviceSize] == Screen38mm)
        NSLog(@"Your screen is 38mm");
    else if ([SDwatchOSVersion deviceSize] == Screen42mm)
        NSLog(@"Your screen size is 42mm");
    
    //Check for iOS Version
    if (watchOSVersionGreaterThanOrEqualTo(@"3"))
        NSLog(@"You are running watchOS 3️⃣ or above!");
    else if (watchOSVersionLessThanOrEqualTo(@"2.2"))
        NSLog(@"You're on watchOS 2.2 or below! ⏳");
}

@end
