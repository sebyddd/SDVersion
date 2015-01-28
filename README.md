![SDiPhoneVersion](https://dl.dropboxusercontent.com/s/z8d85uw2drs9lpm/sdiphoneversion.png)

SDiPhoneVersion 
=============

[![Gitter](https://badges.gitter.im/Join Chat.svg)](https://gitter.im/sebyddd/SDiPhoneVersion?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)![](http://img.shields.io/cocoapods/v/SDiPhoneVersion.svg?style=flat)          ![](http://img.shields.io/cocoapods/p/SDiPhoneVersion.svg?style=flat)    	      ![](http://img.shields.io/cocoapods/l/SDiPhoneVersion.svg?style=flat)

Objective-C library for detecting  the running device's model and screen size.

With the new iPhone models, developers have a little more work to do. This library simplifies their job by allowing them to get information about the running device and easily target the ones they want.

**NEW:** _Now supports iPads and iOS Version Finder as well! Check them out bellow!_

## How to use
```objective-c
      // Check for device model
      if ([SDiPhoneVersion deviceVersion] == iPhone6)
           NSLog(@"You got the new iPhone 6. Nice!");
      else if ([SDiPhoneVersion deviceVersion] == iPhone6Plus)
           NSLog(@"You got the iPhone 6 Plus. Bigger is better!");
	  else if ([SDiPhoneVersion deviceVersion] == iPadAir)
      	   NSLog(@"You own an iPad Air!");

      // Check for device screen size
      if ([SDiPhoneVersion deviceSize] == iPhone4inch)
           NSLog(@"Your screen is 4 inches");
      
      // Get device name
      NSLog(@"%@",[SDiPhoneVersion deviceName]);
      /* e.g: Outputs 'iPhone6,2' */
      
      // Check for iOS Version
      if (iOSVersionGreaterThan(@"8"))
           NSLog(@"You are running iOS 8 or above!");
    
```

## Add to your project
 
There are 2 ways you can add SDiPhoneVersion to your project:
 
### Manual installation
 
 Simply import the 'SDiPhoneVersion' into your project then import the following in the class you want to use it: 
 ```objective-c
       #import "SDiPhoneVersion.h"
 ```      
### Installation with CocoaPods

CocoaPods is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries like SDiPhoneVersion in your projects. See the "[Getting Started](http://guides.cocoapods.org/syntax/podfile.html)" guide for more information.

### Podfile
```ruby
        platform :ios, '5.0'
        pod "SDiPhoneVersion", "~> "1.1.1"
```

      
## Available methods
```objective-c
    +(DeviceVersion)deviceVersion;
    +(DeviceSize)deviceSize;
    +(NSString*)deviceName;
```
### Targetable models
	iPhone4
    iPhone4S
    iPhone5
    iPhone5C
    iPhone5S
    iPhone6
    iPhone6Plus
    
    iPad1
    iPad2
    iPadMini
    iPad3
    iPad4
    iPadAir
    iPadMiniRetina
    
    Simulator

### Targetable screen sizes
    iPhone35inch
    iPhone4inch
    iPhone47inch
    iPhone55inch

### Available iOS Version Finder methods
    iOSVersionEqualTo(@"V")  //E.g: iOSVersionEqualTo(@"8.0.1")
    iOSVersionGreaterThan(@"V")
	iOSVersionGreaterThanOrEqualTo(@"V")
	iOSVersionLessThan(@"V")
	iOSVersionLessThanOrEqualTo(@"V")        

## Credits
- Yasir Turk (iOS Version Finder, StackOverflow)

## License
Usage is provided under the [MIT License](http://http//opensource.org/licenses/mit-license.php). See LICENSE for the full details.


