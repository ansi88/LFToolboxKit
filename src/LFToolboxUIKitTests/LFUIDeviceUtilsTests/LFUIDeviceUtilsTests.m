//
//  LFUIDeviceUtilsTests.m
//  LFUIDeviceUtilsTests
//
//  Created by Jiangwen Tang on 16/7/13.
//  Copyright © 2016年 Youku. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LFUIDeviceUtils.h"

@interface LFUIDeviceUtilsTests : XCTestCase

@end

@implementation LFUIDeviceUtilsTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    BOOL padTmp = [LFUIDeviceUtils isPad] == (([[UIDevice currentDevice] respondsToSelector:@selector(userInterfaceIdiom)] ?
                                [[UIDevice currentDevice] userInterfaceIdiom] :
                                UIUserInterfaceIdiomPhone));
    XCTAssertTrue(padTmp);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
