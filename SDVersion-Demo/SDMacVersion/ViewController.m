//
//  ViewController.m
//  SDMacVersion
//
//  Copyright (c) 2015 Sebastian Dobrincu. All rights reserved.
//

#import "ViewController.h"
#import "SDVersion.h"

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
    
    
    // Get device info
    NSString *deviceVersion    = [SDVersion deviceVersionString];                                // Eg.: MacBookPro
    NSString *deviceSize       = stringFromDeviceSize([SDVersion deviceSize]);                   // Eg.: 15 inch
    NSString *devicePixelSize  = NSStringFromSize([SDVersion deviceScreenResolutionPixelSize]);  // Eg.: Retina screen
    NSString *deviceResolution = stringFromDeviceResolution([SDVersion deviceScreenResolution]); // Eg.: {2880, 1800}
    
    
    // Check OSX Version
    if (OSXVersionLessThanOrEqualTo(@"10"))
        NSLog(@"You're running Yosemite or below.");
    else if(OSXVersionGreaterThanOrEqualTo(@"11"))
        NSLog(@"Looks like you are running OSX 10.11 El Capitan or 🆙.");
    else if (OSXVersionEqualTo(@"9"))
        NSLog(@"Mavericks, what the hell ⁉️");
    
    
    // Check for device model
    if ([SDVersion deviceVersion] == DeviceVersionIMac)
        NSLog(@"So you have a iMac? 💻");
    else if ([SDVersion deviceVersion] == DeviceVersionMacMini)
        NSLog(@"You're using a Mac Mini.");
    
    
    // Check for screen size
    if ([SDVersion deviceSize] == Mac27Inch)
        NSLog(@"Whoah! You got a big ass 27 inch screen.");
    else if ([SDVersion deviceSize] == Mac21Dot5Inch)
        NSLog(@"You have a 21.5 inch screen.");
    
    
    // Check for screen resolution
    if ([SDVersion deviceScreenResolution] == DeviceScreenRetina)
        NSLog(@"Nice retina screen!");
    
    // Get screen resolution in pixels
    NSLog(@"Resolution: %@", devicePixelSize);
    
    // Set label's text
    self.textFieldModel.stringValue               = [self.textFieldModel.stringValue stringByAppendingString:deviceVersion];
    self.textFieldMacScreenInch.stringValue       = [self.textFieldMacScreenInch.stringValue stringByAppendingFormat:@"%@", deviceSize];
    self.textFieldMacScreenPixelSize.stringValue  = [self.textFieldMacScreenPixelSize.stringValue stringByAppendingFormat:@" %@", devicePixelSize];
    self.textFieldMacScreenResolution.stringValue = [self.textFieldMacScreenResolution.stringValue stringByAppendingString:deviceResolution];
 
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    // Set window background color
    self.view.layer.backgroundColor = [NSColor colorWithRed:0.32 green:0.35 blue:0.64 alpha:1].CGColor;
}

@end
