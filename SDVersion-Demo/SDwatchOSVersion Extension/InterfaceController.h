//
//  InterfaceController.h
//  SDwatchOSVersion Extension
//
//  Created by Jeff Kelley on 6/29/16.
//  Copyright © 2016 Sebastian Dobrincu. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface InterfaceController : WKInterfaceController

@property (strong, nonatomic) IBOutlet WKInterfaceLabel *watchVersionLabel;
@property (strong, nonatomic) IBOutlet WKInterfaceLabel *watchSizeLabel;

@end
