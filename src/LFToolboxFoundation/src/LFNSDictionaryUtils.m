//
//  LFNSDictionaryUtilities.m
//  LFToolboxKit
//
//  Created by zhiwei wang on 16/7/1.
//  Copyright © 2016年 Youku. All rights reserved.
//

#import "LFNSDictionaryUtils.h"

@implementation LFNSDictionaryUtils

+ (NSArray *)allKeysSorted:(NSDictionary *)dictionary{
    
    return [[dictionary allKeys] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
}

+ (NSArray *)allValuesSortedByKeys:(NSDictionary *)dictionary{
    
    NSArray *sortedKeys = [self allKeysSorted:dictionary];
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    [sortedKeys enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [arr addObject:obj];
    }]
    return arr;

}

@end
