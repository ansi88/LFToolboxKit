//
//  LFNSStringUtils.h
//  LFToolboxKit
//
//  Created by zhiwei wang on 16/7/1.
//  Copyright © 2016年 Youku. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LFNSStringUtils : NSObject

//md5
+ (NSString *)md5:(NSString *)hashString;

//md5
+ (NSString *)md5WithData:(NSData *)hashData;


/// URL encode (UTF8)
+ (NSString *)lf_stringByURLEncode;
/// URL decode (UTF8)
+ (NSString *)lf_stringByURLDecode;

/// URL encode
+ (NSString *)lf_stringByURLEncode:(NSStringEncoding)encoding;
/// URL decode
+ (NSString *)lf_stringByURLDecode:(NSStringEncoding)encoding;



@end
