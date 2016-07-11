//
//  LFNSDictionaryUtilities.h
//  LFToolboxKit
//
//  Created by zhiwei wang on 16/7/1.
//  Copyright © 2016年 Youku. All rights reserved.
//

#import "LFFoundation.h"

@interface LFNSDictionaryUtils : NSObject

/// 返回所有key (按字典序排列)
+ (NSArray *)allKeysSorted:(NSDictionary *)dictionary;

/// 返回所有value (按key的字典序排列)
+ (NSArray *)allValuesSortedByKeys:(NSDictionary *)dictionary;

#pragma mark - Dictionary Value Getter
///=============================================================================
/// @name Dictionary Value Getter
///=============================================================================
+ (double)dictionary:(NSDictionary *)dictionary doubleForKey:(NSString *)key withDefault:(double)def;

+ (float)dictionary:(NSDictionary *)dictionary floatForKey:(NSString *)key withDefault:(float)def;

+ (int)dictionary:(NSDictionary *)dictionary intForKey:(NSString *)key withDefault:(int)def;

+ (NSInteger)dictionary:(NSDictionary *)dictionary integerForKey:(NSString *)key withDefault:(NSInteger)def;

+ (NSUInteger)dictionary:(NSDictionary *)dictionary unsignedIntegerForKey:(NSString *)key withDefault:(NSInteger)def;

+ (long long)dictionary:(NSDictionary *)dictionary longLongForKey:(NSString *)key withDefault:(long long)def;

+ (BOOL)dictionary:(NSDictionary *)dictionary boolForKey:(NSString *)key withDefault:(BOOL)def;

+ (NSString *)dictionary:(NSDictionary *)dictionary stringForKey:(NSString *)key withDefault:(NSString *)def;

+ (void)dictionary:(NSMutableDictionary *)dictionary setObject:(id)object forKey:(id<NSCopying>)key;



@end
