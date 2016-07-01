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


#pragma mark --Hash
+ (NSString *)md5:(NSString *)hashString{
    
   return [self md5WithData:[hashString dataUsingEncoding:NSUTF8StringEncoding]];
    
}

+ (NSString *)md5WithData:(NSData *)hashData{
    
    NSData *md5Data = [LFCommonDigest MD5:hashData];
    
    NSString *md5String = [LFCCHexStringEncoding encodeData:md5Data];
    
    return md5String;
}


@end
