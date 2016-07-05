
//
//  LFFoundationDefines.h
//  LFToolboxKit
//
//  Created by zhiwei wang on 16/6/30.
//  Copyright © 2016年 Youku. All rights reserved.
//

#ifndef LFFoundationDefines_h
#define LFFoundationDefines_h

#ifndef _LFDevLog
    #ifdef DEBUG
        #define _LFDevLog(...) NSLog(__VA_ARGS__)
    #else
        #define _LFDevLog(...) do { } while (0)
    #endif
#endif /*_LFDevLog*/


FOUNDATION_STATIC_INLINE int lcm(int a, int b) {
    for (int aa = a, bb = b;;) {
        if (aa == bb)
            return aa;
        else if (aa < bb)
            aa += a;
        else
            bb += b;
    }
}

#endif /* LFFoundationDefines_h */
