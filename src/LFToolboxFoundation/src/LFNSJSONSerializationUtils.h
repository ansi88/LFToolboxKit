//
//  LFNSJSONSerializationUtils.h
//  LFToolboxKit
//
//  Created by zhiwei wang on 16/7/4.
//  Copyright © 2016年 Youku. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LFNSJSONSerializationUtils : NSObject

/// 编码为 json 字符串。 如果出错则返回nil。 内容支持NSString/NSNumber/NSDictionary/NSArray
+ (NSString *) serizlizeToJson:(NSObject *) object;


/// 编码为 json 字符串(带格式)。 如果出错则返回nil。 内容支持NSString/NSNumber/NSDictionary/NSArray
+ (NSString *) serizlizeToPrettyJson:(NSObject *) object;

/*!
 	@method
 	@abstract
 	@discussion	以json方式解码，返回 NSDictionary 或 NSArray。出错则返回nil
 	@result
 */
+ (id) serizlizeToJsonObject:(NSString *) string;



@end
