//
//  LFNSArrayUtilities.h
//  LFToolboxKit
//
//  Created by zhiwei wang on 16/7/1.
//  Copyright © 2016年 Youku. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LFNSArrayUtilities : NSObject

/// 编码为 json 字符串。 如果出错则返回nil。 内容支持NSString/NSNumber/NSDictionary/NSArray
+ (NSString *) jsonStringEncoded:(NSArray *) array;


/// 编码为 json 字符串(带格式)。 如果出错则返回nil。 内容支持NSString/NSNumber/NSDictionary/NSArray
+ (NSString *) jsonPrettyStringEncoded:(NSArray *) array;


@end
