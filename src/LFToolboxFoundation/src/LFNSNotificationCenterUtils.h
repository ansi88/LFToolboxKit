//
//  LFNSNotificationCenterUtils.h
//  LFToolboxKit
//
//  Created by zhiwei wang on 16/7/11.
//  Copyright © 2016年 Youku. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LFNSNotificationCenterUtils : NSObject

+ (void)postNotificationOnMainThreadWithName:(NSString *)name object:(id)object;

+ (void)postNotificationOnMainThreadWithName:(NSString *)name object:(id)object userInfo:(NSDictionary *)userInfo;


@end
