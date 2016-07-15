//
//  LFMathTestCase.m
//  LFToolboxKit
//
//  Created by zhiwei wang on 16/6/30.
//  Copyright © 2016年 Youku. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LFObjectTransformer.h"
#import "LTMMath.h"
@interface LFMathTestCase : XCTestCase

@end

@implementation LFMathTestCase

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    
    CGRect testRect = CGRectMake(123.33, 345.45, 45.98, 34.98);
    
    CGRect floorRect = [LFMath floorCGRect:testRect];
    XCTAssertTrue(CGRectEqualToRect(CGRectMake(123, 345, 45, 34), floorRect));
    
    CGRect ceilCGRect = [LFMath ceilCGRect:testRect];
    XCTAssertTrue(CGRectEqualToRect(CGRectMake(124, 346, 46, 35), ceilCGRect));
    
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)testTransformer {
    
    //测试string 转data 再转回string
    NSString *strA = @"helloworld";
    NSString *strB = @"helloworld";
    
    XCTAssertTrue([strB isEqualToString:[LFObjectTransformer data2string:[LFObjectTransformer string2data:strA]]]);
    
    //测试dict转data 再转回dict
    NSDictionary *dictA = @{@"a":@"b"};
    NSDictionary *dictB = @{@"a":@"b"};
    
    XCTAssertTrue([dictB isEqualToDictionary:[LFObjectTransformer data2dictionary:[LFObjectTransformer dictionary2data:dictA]]]);
    
    //测试arr转data 再转回arr
    NSArray *arrA = @[@"1",@"2",@"3"];
    NSArray *arrB = @[@"1",@"2",@"3"];
    
    XCTAssertTrue([arrB isEqualToArray:[LFObjectTransformer data2array:[LFObjectTransformer array2data:arrA]]]);
    //测试dict转json 打印 再转回dict
    NSDictionary *dictC = @{@"key":@"value",@"number":@2};
    NSData *jsonData = [LFObjectTransformer dictionary2JSONdata:dictC];
    NSLog(@"%@",[LFObjectTransformer data2string:jsonData]);
    NSDictionary *dictD = [LFObjectTransformer JSONdata2dictionary:jsonData];
    NSLog(@"%@",dictD);
    XCTAssertTrue([dictC isEqualToDictionary:dictD]);
    
    //测试dict转json 打印 再转回dict
    NSArray *arrC = @[@"value",@2];
    NSData *jsonData2 = [LFObjectTransformer array2JSONdata:arrC];
    NSLog(@"%@",[LFObjectTransformer data2string:jsonData2]);
    NSArray *arrD = [LFObjectTransformer JSONdata2array:jsonData2];
    NSLog(@"%@",arrD);
    XCTAssertTrue([arrD isEqualToArray:arrC]);

    
    //测试byte转data 再转回byte
    Byte byte[] = {1,2,3,4};
    NSData *data = [LFObjectTransformer byte2data:byte];
    Byte *testByte = [LFObjectTransformer data2byte:data];
    for(int i=0;i<[data length];i++) {
        XCTAssertEqual(testByte[i], byte[i]);
    }
    //测试date转string 和 工具转换的是否一致
    NSDate *now = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSString *formatterString = @"yyyy-MM-dd HH:mm:ss.SSS";
    [formatter setDateFormat:formatterString];
    NSString *nowStringA = [formatter stringFromDate:now];
    NSString *nowStringB = [LFObjectTransformer date2string:now formatter:formatterString];
    XCTAssertTrue([nowStringA isEqualToString:nowStringB]);
    
    //String<=>URL
    NSString *urlStrA = @"www.youku.com";
    NSString *urlStrB = [LFObjectTransformer URLl2string:[LFObjectTransformer string2URL:urlStrA]];
    XCTAssertTrue([urlStrA isEqualToString:urlStrB]);

    //base64
    NSString *originalStr = @"abcd";
    NSString *base64Str = @"YWJjZA==";
    NSData *base64Data = [LFObjectTransformer data2base64data:[LFObjectTransformer string2data:originalStr]];
    XCTAssertTrue([base64Str isEqualToString:[LFObjectTransformer data2string:base64Data]]);
    
    //MD5
    NSString *MD5Str = @"e2fc714c4727ee9395f324cd2e7f331f";
    XCTAssertTrue([MD5Str isEqualToString:[LFObjectTransformer string2MD5string:originalStr]]);
    
    //URLEncoding
    NSString *originalURLStr = @"http://www.youku.com";
    NSString *urlEncodingString = @"http%3a%2f%2fwww.youku.com";
    XCTAssertTrue([urlEncodingString isEqualToString:[[LFObjectTransformer string2URLencodingString:originalURLStr] lowercaseString]]);
    
    NSString *urldecodeing = [LFObjectTransformer URLencodingString2string:urlEncodingString];
    XCTAssertTrue([originalURLStr isEqualToString:urldecodeing]);
}
@end
