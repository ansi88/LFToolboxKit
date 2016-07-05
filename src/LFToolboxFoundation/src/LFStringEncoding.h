//
//  LFStringEncoding.h
//  LFToolboxKit
//
//  Created by zhiwei wang on 16/7/5.
//  Copyright © 2016年 Youku. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, LFCommonCoderType){
    /**
     * 二进制
     */
    LFBinaryStringEncoding,
    /**
     * 十六进制
     */
    LFHexStringEncoding,
    /**
     * Base64
     */
    LFBase64StringEncoding,
    /**
     * Base64Websafe
     */
    LFBase64WebsafeStringEncoding,
};



@protocol LFStringCoding<NSObject>

@required

/*!
 	@method
 	@abstract
 	@discussion	编码
 	@param 	string 	编码内容
 	@param 	encoding 	编码方式
 	@result
 */
- (NSString *)encodeString:(NSString *)string  usingEncoding:(NSStringEncoding)encoding;

/*!
 	@method
 	@abstract
 	@discussion	解码
 	@param 	string 	解码内容
 	@param 	encoding 	解码方法
 	@result
 */
- (NSString *)decodeString:(NSString *)string  usingEncoding:(NSStringEncoding)encoding;



@end

@interface LFStringCoding : NSObject<LFStringCoding>


/*!
 	@method
 	@abstract
 	@discussion	普通编码器
 	@param 	coderType 	编码器类型
 	@result
 */
+ (id<LFStringCoding>)commonCoderWithType:(LFCommonCoderType)coderType;


/*!
 	@method
 	@abstract	URL编码器
 	@discussion
 	@result
 */
+ (id<LFStringCoding>)URLCoder;




@end
