//
//  SDiPhoneVersion.h
//  SDiPhoneVersion
//
//  Created by Sebastian Dobrincu on 09/09/14.
//  Copyright (c) 2014 Sebastian Dobrincu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>
#import <sys/utsname.h>

@interface SDiPhoneVersion : NSObject

typedef NS_ENUM(NSInteger, DeviceVersion){
    iPhone4 = 0,
    iPhone4S = 1,
    iPhone5 = 2,
    iPhone5C = 3,
    iPhone5S = 4,
    iPhone6 = 5,
    iPhone6Plus = 6,
    Simulator = 7
};

typedef NS_ENUM(NSInteger, DeviceSize){
    iPhone35inch = 1,
    iPhone4inch = 2,
    iPhone47inch = 3,
    iPhone55inch = 4
};

+(DeviceVersion)deviceVersion;
+(DeviceSize)deviceSize;

@end
