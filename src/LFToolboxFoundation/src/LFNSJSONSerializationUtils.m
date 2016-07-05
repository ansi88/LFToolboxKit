//
//  LFNSJSONSerializationUtils.m
//  LFToolboxKit
//
//  Created by zhiwei wang on 16/7/4.
//  Copyright © 2016年 Youku. All rights reserved.
//

#import "LFNSJSONSerializationUtils.h"

@implementation LFNSJSONSerializationUtils

/// 编码为 json 字符串。 如果出错则返回nil。 内容支持NSString/NSNumber/NSDictionary/NSArray
+ (NSString *) serizlizeToJson:(NSObject *) object{
    
    if ([NSJSONSerialization isValidJSONObject:object]) {
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object options:0 error:&error];
        if (!error) {
            NSString *json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
            return json;
        }
        
    }
    return nil;
    
}


/// 编码为 json 字符串(带格式)。 如果出错则返回nil。 内容支持NSString/NSNumber/NSDictionary/NSArray
+ (NSString *) serizlizeToPrettyJson:(NSObject *) object{
    
    if ([NSJSONSerialization isValidJSONObject:object]) {
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object options:NSJSONWritingPrettyPrinted error:&error];
        if (!error) {
            NSString *json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
            return json;
        }
    }
    return nil;
    
}

+ (id) serizlizeToJsonObject:(NSString *) string{
    
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    id value = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    if (error) {
        return nil;
    }
    return  value;
}

@end
