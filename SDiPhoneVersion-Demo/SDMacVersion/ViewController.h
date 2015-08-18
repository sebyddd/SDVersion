//
//  ViewController.h
//  SDMacVersion
//
//  Created by Tom Baranes on 17/08/15.
//  Copyright (c) 2015 Sebastian Dobrincu. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController

@property (weak) IBOutlet NSTextField *textFieldModel;
@property (weak) IBOutlet NSTextField *textFieldVersion;
@property (weak) IBOutlet NSTextField *textFieldReleaseYear;
@property (weak) IBOutlet NSTextField *textFieldMacSreenInch;
@property (weak) IBOutlet NSTextField *textFieldMacScreenResolution;
@property (weak) IBOutlet NSTextField *textFieldMacSceenPixelSize;

@end

