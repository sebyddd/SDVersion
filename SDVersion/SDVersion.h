//
//  SDVersion.h
//  SDiPhoneVersion
//
//  Copyright (c) 2015 Sebastian Dobrincu. All rights reserved.
//

#ifndef SDiPhoneVersion_SDVersion_h
#define SDiPhoneVersion_SDVersion_h

#if (TARGET_IPHONE_SIMULATOR || TARGET_OS_IPHONE)
	#import "SDiPhoneVersion.h"
	#define SDVersion SDiPhoneVersion
#else
	#import "SDMacVersion.h"
	#define SDVersion SDMacVersion
#endif

#endif
