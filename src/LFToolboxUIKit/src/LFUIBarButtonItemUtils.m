//
//  LFUIBarButtonItemUtils.m
//  LFToolboxKit
//
//  Created by zhiwei wang on 16/7/12.
//  Copyright © 2016年 Youku. All rights reserved.
//

#import "LFUIBarButtonItemUtils.h"

@implementation LFUIBarButtonItemUtils

//+ (UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title
//                                      image:(UIImage *)image
//                           heightLightImage:(UIImage *)hlImage
//                               disableImage:(UIImage *)disImage
//                                     target:(id)target
//                                     action:(SEL)selector{
//    
//    UIButton* customButton = [self lf_rsCustomBarButtonWithTitle:title
//                                                           image:image
//                                                heightLightImage:hlImage
//                                                    disableImage:disImage
//                                                          target:target
//                                                          action:selector];
//    CGSize sizeOfTitle = CGSizeZero;
//    if (title!=nil && ![title isEqualToString:@""]) {
//        sizeOfTitle = [title lf_sizeForFont:customButton.titleLabel.font size:CGSizeMake(100.0f, 22.0f) mode:NSLineBreakByTruncatingMiddle];
//    }
//    
//    CGFloat width = 100.0f;
//    CGFloat height = 44.0f;
//    CGFloat x = 0.0f;
//    CGFloat y = 0.0f;
//    if (customButton.currentImage != nil) {
//        width = customButton.currentImage.size.width;
//        height = customButton.currentImage.size.height;
//    }
//    if (sizeOfTitle.width <= 0.0f) {
//        [customButton setFrame:CGRectMake(x,
//                                          y,
//                                          width,
//                                          height)];
//    }else {
//        [customButton setFrame:CGRectMake(x,
//                                          y,
//                                          sizeOfTitle.width+32.0f,
//                                          height)];
//    }
//    customButton.titleEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 0);
//    customButton.titleLabel.font = [UIFont systemFontOfSize:16.f];
//    UIBarButtonItem *barBtnItem  = [[UIBarButtonItem alloc] initWithCustomView:customButton];
//    barBtnItem.width             = customButton.lf_width;
//    return barBtnItem;
//    
//}
//
//#pragma mark --private
//+ (UIButton*)customBarButtonWithTitle:(NSString*)title
//                                     image:(UIImage *)image
//                          heightLightImage:(UIImage *)hlImage
//                              disableImage:(UIImage *)disImage
//                                    target:(id)target
//                                    action:(SEL)selector
//{
//    UIButton *customButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    
//    if (image != nil) {
//        [customButton setImage:image forState:UIControlStateNormal];
//        [customButton setBackgroundColor:[UIColor clearColor]];
//    }
//    else {
//        
//    }
//    if (hlImage != nil) {
//        [customButton setImage:hlImage forState:UIControlStateHighlighted];
//    }
//    if (nil != disImage)
//    {
//        [customButton setImage:disImage forState:UIControlStateDisabled];
//    }
//    if (title.length <= 2) {
//        [customButton.titleLabel setFont:[UIFont systemFontOfSize:15.0f]];
//    }
//    else
//    {
//        [customButton.titleLabel setFont:[UIFont systemFontOfSize:13.0f]];
//    }
//    
//    [customButton.titleLabel setShadowOffset:CGSizeMake(0.0f, 0.5f)];
//    if (title!=nil && ![title isEqualToString:@""]) {
//        [customButton setTitle:title forState:UIControlStateNormal];
//        [customButton setTitleColor:LFUIColorWithHexRGB(0xffa000) forState:UIControlStateNormal];
//        if (![UIBarButtonItem isHigherIOS7]) {
//            [customButton setTitleShadowColor:[UIColor blackColor] forState:UIControlStateNormal];
//            [customButton setTitleShadowColor:LFUIColorWithRGBA(0, 0, 0, 0.4) forState:UIControlStateDisabled];
//        }
//    }
//    [customButton setTitleColor:[LFUIColorWithHexRGB(0xffa000) colorWithAlphaComponent:0.3] forState:UIControlStateDisabled];
//    [customButton addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
//    
//    return customButton;
//}

+ (BOOL)isHigherIOS7
{
    NSString * requestSysVer = @"7.0";
    NSString *currentSysVer = [[UIDevice currentDevice] systemVersion];
    if ([currentSysVer compare:requestSysVer options:NSNumericSearch] != NSOrderedAscending) {
        
        return YES;
    }
    
    return NO;
}


@end
