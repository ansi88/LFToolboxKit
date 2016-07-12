//
//  UIGestureRecognizer+LFAdd.h
//
//
//  Created by guoyaoyuan on 14-10-13.
//  Copyright (c) 2014 live Interactive. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 Provides extensions for `UIGestureRecognizer`.
 */
@interface UIGestureRecognizer (LFAdditions)

/**
 Initializes an allocated gesture-recognizer object with a action block.
 
 @param block  An action block that to handle the gesture recognized by the 
               receiver. nil is invalid. It is retained by the gesture.
 
 @return An initialized instance of a concrete UIGestureRecognizer subclass or 
         nil if an error occurred in the attempt to initialize the object.
 */
- (instancetype)initWithActionBlock:(void (^)(id sender))block;

/**
 Adds an action block to a gesture-recognizer object. It is retained by the 
 gesture.
 
 @param block A block invoked by the action message. nil is not a valid value.
 */
- (void)lf_addActionBlock:(void (^)(id sender))block;

/**
 Remove all action blocks.
 */
- (void)lf_removeAllActionBlocks;

@end
