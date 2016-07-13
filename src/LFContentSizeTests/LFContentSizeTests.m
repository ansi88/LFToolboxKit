//
//  LFContentSizeTests.m
//  LFContentSizeTests
//
//  Created by Jiangwen Tang on 16/7/13.
//  Copyright © 2016年 Youku. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LFContentSize.h"

@interface LFContentSizeTests : XCTestCase

@end

@implementation LFContentSizeTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    CGSize size = [LFContentSize sizeForContent:@"LaiFeng" size:(CGSize){100,MAXFLOAT} font:[UIFont systemFontOfSize:14.f] mode:NSLineBreakByWordWrapping];
    XCTAssert(size.width <= 100 && size.height >= 14);
    
    CGFloat h = [LFContentSize heightForContent:@"LaiFeng" width:100 font:[UIFont systemFontOfSize:14.f]];
    XCTAssert(h >= 14);
    
    CGFloat w = [LFContentSize widthForContent:@"LaiFeng" height:15 font:[UIFont systemFontOfSize:14.f]];
    XCTAssert(w > 0);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
