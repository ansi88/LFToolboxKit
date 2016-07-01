//
//  LFContentSize.h
//  LFToolboxKit
//
//  Created by zhiwei wang on 16/7/1.
//  Copyright © 2016年 Youku. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LFUIKit.h"

@interface LFContentSize : NSObject

// 计算内容的size
+ (CGSize) sizeForContent:(NSString *)content size:(CGSize)size font:(UIFont *)font mode:(NSLineBreakMode)lineBreakMode;

//计算固定高度的行宽
+ (CGFloat) widthForContent:(NSString *)content height:(CGFloat)height font:(UIFont *)font;

//计算固定宽度的行高
+ (CGFloat) heightForContent:(NSString *)content width:(CGFloat)width  font:(UIFont *)font;



@end
