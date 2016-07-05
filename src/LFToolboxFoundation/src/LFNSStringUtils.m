//
//  LFNSStringUtils.m
//  LFToolboxKit
//
//  Created by zhiwei wang on 16/7/1.
//  Copyright © 2016年 Youku. All rights reserved.
//

#import "LFNSStringUtils.h"
#import "LFCommonCrypto.h"

@implementation LFNSStringUtils


#pragma mark --md5
+ (NSString *)md5:(NSString *)hashString{
    
   return [self md5WithData:[hashString dataUsingEncoding:NSUTF8StringEncoding]];
    
}

+ (NSString *)md5WithData:(NSData *)hashData{
    
    NSData *md5Data = [LFCommonDigest MD5:hashData];
    
    NSString *md5String = [LFCCHexStringEncoding encodeData:md5Data];
    
    return md5String;
}

#pragma mark --Utilities

+ (NSString *)stringWithUUID{
    
    CFUUIDRef uuid = CFUUIDCreate(NULL);
    CFStringRef string = CFUUIDCreateString(NULL, uuid);
    CFRelease(uuid);
    return (__bridge_transfer NSString *)string);
}

+ (NSString *)stringByTrim:(NSString *)string{
    
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    return [string stringByTrimmingCharactersInSet:set];
}

+ (BOOL)stringIsNotBlank:(NSString *)string{
    
    if (!string) {
        return NO;
    }else if ([@"" isEqualToString:string] || [@"(null)" isEqualToString:string]){
        return NO;
    }
    NSCharacterSet *blank = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    for (NSInteger i = 0; i < string.length; i++) {
        unichar c = [string characterAtIndex:i];
        if (![blank characterIsMember:c]) {
            return YES;
        }
    }
    return NO;
}
@end
