//
//  LFUIKitDefines.h
//  LFToolboxKit
//
//  Created by zhiwei wang on 16/6/30.
//  Copyright © 2016年 Youku. All rights reserved.
//

#ifndef LFUIKitDefines_h
#define LFUIKitDefines_h

#import "LFUIKit.h"

///系统版本
#ifndef kiOS7Later
#define kiOS7Later [[UIDevice currentDevice].systemVersion floatValue] > 7.0
#endif


static inline CGRect CGRectCeil(CGRect rect){
    return CGRectMake(ceil(rect.origin.x), ceil(rect.origin.y), ceil(rect.size.width), ceil(rect.size.height));
}

static inline CGSize CGSizeCeil(CGSize size){
    return  CGSizeMake(ceil(size.width), ceil(size.height));
}

#endif /* LFUIKitDefines_h */
