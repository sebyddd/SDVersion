//
//  MacVersionTests.swift
//  SDVersion
//
//  Created by lijunjie on 04/03/2017.
//  Copyright © 2017 Sebastian Dobrincu. All rights reserved.
//

import XCTest

class MacVersionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        let deviceSize = SDMacVersion.deviceSizeName(SDMacVersion.deviceSize())
        XCTAssert(deviceSize != nil);
        let deviceScreenResolutionName = SDMacVersion.deviceScreenResolutionName(SDMacVersion.deviceScreenResolution())
        XCTAssert(deviceScreenResolutionName != nil)
    }
    
}
