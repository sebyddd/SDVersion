//
//  ViewController.m
//  SDMacVersion
//
//  Created by Tom Baranes on 17/08/15.
//  Copyright (c) 2015 Sebastian Dobrincu. All rights reserved.
//

#import "ViewController.h"
#import "SDMacVersion.h"

@implementation ViewController

#pragma mark -

- (void)awakeFromNib {
	[super awakeFromNib];
	self.view.layer.backgroundColor = [NSColor colorWithRed:58.f / 255.f green:192.f / 255.f blue:98.f / 255.f alpha:1].CGColor;
}
- (void)viewDidLoad {
	[super viewDidLoad];
	[SDMacVersion deviceVersion];
	// Do any additional setup after loading the view.
}

@end
