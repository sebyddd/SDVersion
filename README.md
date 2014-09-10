![SDiPhoneVersion](https://dl.dropboxusercontent.com/s/z8d85uw2drs9lpm/sdiphoneversion.png)
SDiPhoneVersion
===============

Objective-C library for detecting running device model and screen size.

With the announcement of the new iPhone models, developers have a little more work to do. This library simplifies their job by allowing them to get information about the running device and easily target the one they want.

## How to use
```objective-c
      //Check for device model
      if ([SDiPhoneVersion deviceVersion] == iPhone6)
           NSLog(@"You got the new iPhone 6. Nice!");
      else if ([SDiPhoneVersion deviceVersion] == iPhone6Plus)
           NSLog(@"You got the iPhone 6 Plus. Bigger is better!");
          
      // Check for device screen size
      if ([SDiPhoneVersion deviceSize] == iPhone4inch)
           NSLog(@"Your screen is 4 inches");
      
      //Get device name
      NSLog(@"%@",[SDiPhoneVersion deviceName]);
      /* e.g: Outputs 'iPhone6,2' */
```

## Add to your project
 
There are 2 ways you can add SDiPhoneVersion to your project:
 
### Manual installation
 
 Simply import the 'SDiPhoneVersion' into your project then import the following in the class you want to use it: 
 ```objective-c
       #import "SDiPhoneVersion.h"
 ```      
### Cocoapods
_* Coming soon *_
      
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
    Simulator

### Targetable screen sizes
    iPhone35inch
    iPhone4inch
    iPhone47inch
    iPhone55inch

### TODO
- Add Cocoapods

## License
Usage is provided under the [MIT License](http://http//opensource.org/licenses/mit-license.php). See LICENSE for the full details.


