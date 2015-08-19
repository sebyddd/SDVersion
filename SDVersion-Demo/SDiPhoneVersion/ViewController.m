//
//  ViewController.m
//  SDiPhoneVersion
//
//  Created by Sebastian Dobrincu on 10/09/14.
//  Copyright (c) 2014 Sebastian Dobrincu. All rights reserved.
//

#import "ViewController.h"
#import "SDVersion.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Get device name as NSString
    self.iphoneVersionLabel.text = [self.iphoneVersionLabel.text stringByAppendingString:stringFromDeviceVersion([SDVersion deviceVersion])];

    // Get device size using string conversion
    self.iphoneSizeLabel.text    = [self.iphoneSizeLabel.text stringByAppendingString:[NSString stringWithFormat:@"%@", stringFromDeviceSize([SDVersion deviceSize])]];
    
    // Check for device model
    if ([SDVersion deviceVersion] == iPhone6)
        NSLog(@"You got the iPhone 6. Nice!");
    else if ([SDVersion deviceVersion] == iPhone5S)
        NSLog(@"You got the iPhone 5S. Good device!");
    
    // Check for device screen size
    if ([SDVersion deviceSize] == iPhone35inch)
        NSLog(@"Your screen is 3.5 inches");
    else if ([SDVersion deviceSize] == iPhone4inch)
        NSLog(@"Your screen size is 4 inches");
    else if([SDVersion deviceSize] == iPhone47inch)
        NSLog(@"Your screen size is 4.7 inches");
    else if([SDVersion deviceSize] == iPhone55inch)
        NSLog(@"Your screen size is 5.5 inches");
    
    //Check for iOS Version
    if (iOSVersionGreaterThanOrEqualTo(@"9"))
        NSLog(@"You are running iOS 9️⃣ or above!");
    else if (iOSVersionLessThanOrEqualTo(@"8.4"))
        NSLog(@"You're on iOS 8.4 or below! ⏳");
}


@end
