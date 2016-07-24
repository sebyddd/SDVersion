//
//  ViewController.m
//  SDtvOSVersion
//
//  Created by Jeff Kelley on 7/20/16.
//  Copyright © 2016 Sebastian Dobrincu. All rights reserved.
//

#import "ViewController.h"

#import "SDVersion.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *tvVersionLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Get device name as NSString
    self.tvVersionLabel.text = [self.tvVersionLabel.text stringByAppendingString:DeviceVersionNames[[SDtvOSVersion deviceVersion]]];
    
    // Check for device model
    if ([SDtvOSVersion deviceVersion] == AppleTV4)
        NSLog(@"You got the fourth-generation Apple TV. Nice!");
    
    //Check for tvOS Version
    if (tvOSVersionGreaterThanOrEqualTo(@"10"))
        NSLog(@"You are running tvOS 🔟 or above!");
    else if (tvOSVersionLessThanOrEqualTo(@"9.2"))
        NSLog(@"You're on tvOS 9.2 or below! ⏳");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
