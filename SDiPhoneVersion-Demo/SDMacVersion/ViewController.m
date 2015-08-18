//
//  ViewController.m
//  SDMacVersion
//
//  Created by Tom Baranes on 17/08/15.
//  Copyright (c) 2015 Sebastian Dobrincu. All rights reserved.
//

#import "ViewController.h"
#import "SDVersion.h"

@implementation ViewController

#pragma mark -

- (void)awakeFromNib {
	[super awakeFromNib];
	self.view.layer.backgroundColor = [NSColor colorWithRed:58.f / 255.f green:192.f / 255.f blue:98.f / 255.f alpha:1].CGColor;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	self.textFieldVersion.stringValue = [self.textFieldVersion.stringValue stringByAppendingFormat:@"%ld", [SDVersion deviceVersion]];
	self.textFieldModel.stringValue = [self.textFieldModel.stringValue stringByAppendingString:[SDVersion deviceName]];
	self.textFieldReleaseYear.stringValue = [self.textFieldReleaseYear.stringValue stringByAppendingFormat:@"%ld", [SDVersion deviceReleaseYear]];
	self.textFieldMacSreenInch.stringValue = [self.textFieldMacSreenInch.stringValue stringByAppendingFormat:@"%ld", [SDVersion deviceSize]];
	self.textFieldMacSceenPixelSize.stringValue = [self.textFieldMacSceenPixelSize.stringValue stringByAppendingFormat:@" {%.1f, %.1f}", [SDVersion deviceScreenResolutionPixelSize].width, [SDVersion deviceScreenResolutionPixelSize].height];

	DeviceScreenResolution screenResolution = [SDVersion deviceScreenResolution];
	NSString *resolutionText = @"";
	switch (screenResolution) {
		case DeviceScreenRetina: resolutionText = @"retina"; break;
		case DeviceScreenNoRetina: resolutionText = @"no retina"; break;
		default: resolutionText = @"unknown";
	}
	self.textFieldMacScreenResolution.stringValue = [self.textFieldMacScreenResolution.stringValue stringByAppendingString:resolutionText];
}

@end
