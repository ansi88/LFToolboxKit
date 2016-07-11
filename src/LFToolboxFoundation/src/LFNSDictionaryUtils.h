//
//  LFNSDictionaryUtilities.h
//  LFToolboxKit
//
//  Created by zhiwei wang on 16/7/1.
//  Copyright © 2016年 Youku. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LFNSDictionaryUtils : NSObject

/// 返回所有key (按字典序排列)
+ (NSArray *)allKeysSorted:(NSDictionary *)dictionary;

/// 返回所有value (按key的字典序排列)
+ (NSArray *)allValuesSortedByKeys:(NSDictionary *)dictionary;



@end
