//
//  ViewController.m
//  SDiOSVersion
//
//  Copyright (c) 2015 Sebastian Dobrincu. All rights reserved.
//

#import "ViewController.h"
#import "SDVersion.h"

@implementation ViewController

- (BOOL)prefersStatusBarHidden {
    return true;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Get device name as NSString
    self.iphoneVersionLabel.text = [self.iphoneVersionLabel.text stringByAppendingString:[SDVersion deviceNameString]];

    // Get device size using string conversion
    self.iphoneSizeLabel.text = [self.iphoneSizeLabel.text stringByAppendingString:[NSString stringWithFormat:@"%@", [SDVersion deviceSizeName:[SDVersion deviceSize]]]];
    
    // Check for device model
    if ([SDVersion deviceVersion] == iPhone7)
        NSLog(@"You got the iPhone 7. Nice!");
    else if ([SDVersion deviceVersion] == iPhone6SPlus)
        NSLog(@"You got the iPhone 6S Plus. Awesome device!");
    else if ([SDVersion deviceVersion] == iPodTouch6Gen)
        NSLog(@"The latest iPod Touch. Cool! ❄️");
    
    // Check for device screen size
    if ([SDVersion deviceSize] == Screen3Dot5inch)
        NSLog(@"Your screen is 3.5 inches");
    else if ([SDVersion deviceSize] == Screen4inch)
        NSLog(@"Your screen size is 4 inches");
    else if([SDVersion deviceSize] == Screen4Dot7inch)
        NSLog(@"Your screen size is 4.7 inches");
    else if([SDVersion deviceSize] == Screen5Dot5inch)
        NSLog(@"Your screen size is 5.5 inches");
    else if([SDVersion deviceSize] == Screen5Dot8inch)
        NSLog(@"Your screen size is 5.8 inches");
    else if([SDVersion deviceSize] == Screen6Dot1inch)
        NSLog(@"Your screen size is 6.1 inches");
    else if([SDVersion deviceSize] == Screen6Dot5inch)
        NSLog(@"Your screen size is 6.5 inches");
    
    if ([SDVersion isZoomed]) {
        NSLog(@"Your device is in Zoom Mode!");
    }
    
    //Check for iOS Version
    if ([SDVersion versionGreaterThanOrEqualTo:@"10"])
        NSLog(@"You are running iOS 1️⃣0️⃣ or above!");
    else if ([SDVersion versionLessThanOrEqualTo:@"9.1"])
        NSLog(@"You're on iOS 9.1 or below! ⏳");
}

@end
