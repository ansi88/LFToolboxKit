//
//  LFUIScrollViewUtils.h
//  LFToolboxKit
//
//  Created by zhiwei wang on 16/7/12.
//  Copyright © 2016年 Youku. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LFUIScrollViewUtility : NSObject


+ (void)scrollView:(UIScrollView *)scrollView scrollToTopAnimated:(BOOL)animated;

+ (void)scrollView:(UIScrollView *)scrollView scrollToBottomAnimated:(BOOL)animated;

+ (void)scrollView:(UIScrollView *)scrollView scrollToLeftAnimated:(BOOL)animated;

+ (void)scrollView:(UIScrollView *)scrollView scrollToRightAnimated:(BOOL)animated;
    


@end
