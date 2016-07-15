//
//  LFUIBarButtonItemUtils.h
//  LFToolboxKit
//
//  Created by zhiwei wang on 16/7/12.
//  Copyright © 2016年 Youku. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LFUIBarButtonItemUtility : NSObject

+ (UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title
                                           image:(UIImage *)image
                                heightLightImage:(UIImage *)hlImage
                                    disableImage:(UIImage *)disImage
                                          target:(id)target
                                          action:(SEL)selector;

+ (UIBarButtonItem *)leftBarButtonItemWithTitle:(NSString *)title
                                               image:(UIImage *)image
                                    heightLightImage:(UIImage *)hlImage
                                        disableImage:(UIImage *)disImage
                                              target:(id)target
                                              action:(SEL)selector;

@end
