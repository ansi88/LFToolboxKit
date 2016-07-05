//
//  LFNSStringUtils.h
//  LFToolboxKit
//
//  Created by zhiwei wang on 16/7/1.
//  Copyright © 2016年 Youku. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LFNSStringUtils : NSObject


///=============================================================================
/// @name md5
///=============================================================================
//md5
+ (NSString *)md5:(NSString *)hashString;

//md5
+ (NSString *)md5WithData:(NSData *)hashData;


///=============================================================================
/// @name Utilities
///=============================================================================
/*!
 	@method
 	@abstract
 	@discussion	返回一个随机 UUID 例如 "D1178E50-2A4D-4F1F-9BD3-F6AAB00E06B1"
 	@result
 */
+ (NSString *)stringWithUUID;

/*!
 	@method
 	@abstract
 	@discussion	切去头尾的空白字符 (空格/换行等)
 	@result
 */
+ (NSString *)stringByTrim:(NSString *)string;

/*!
 	@method
 	@abstract
 	@discussion	是否非空 (例如 nil, @"", @"  ", @"\n" 返回 NO)
 	@param 	string
 	@result
 */
+ (BOOL)stringIsNotBlank:(NSString *)string;


//缺少 stringURLEncode  stringURLDecode 

@end
