//
//  LFCoreDefines.h
//  LFToolboxKit
//
//  Created by zhiwei wang on 16/6/30.
//  Copyright © 2016年 Youku. All rights reserved.
//

#ifndef LFCoreDefines_h
#define LFCoreDefines_h

#ifndef LF_NO_DESIGNATED_INITIALIZER
#define LF_NO_DESIGNATED_INITIALIZER() \
        @throw [NSException exceptionWithName:NSInvalidArgumentException \
                                       reason:[NSString stringWithFormat:@"unrecognized selector sent to instance %p", self] \
                                     userInfo:nil]
#endif /*LF_NO_DESIGNATED_INITIALIZER */


#endif /* LFCoreDefines_h */
