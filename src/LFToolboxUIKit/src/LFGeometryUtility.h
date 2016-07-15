//
//  LFGeometryUtils.h
//  LaiFeng
//
//  Created by wangxiaoxiang on 16/6/8.
//  Copyright © 2016年 live Interactive. All rights reserved.
//

#import <CoreGraphics/CoreGraphics.h>
#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, LFScaling) {
    LFScaleProportionally = 0,   // Fit proportionally
    LFScaleToFit,                // Forced fit (distort if necessary)
    LFScaleNone,                 // Don't scale (clip)
    LFScaleToFillProportionally = 101  // Scale proportionally to fill area
};

typedef NS_ENUM(NSUInteger, LFRectAlignment) {
    LFRectAlignCenter = 0,
    LFRectAlignTop,
    LFRectAlignTopLeft,
    LFRectAlignTopRight,
    LFRectAlignLeft,
    LFRectAlignBottom,
    LFRectAlignBottomLeft,
    LFRectAlignBottomRight,
    LFRectAlignRight
};

#pragma mark -
#pragma mark CG - Point On Rect

/// Return middle of min X side of rectangle
//
//  Args:
//    rect - rectangle
//
//  Returns:
//    point located in the middle of min X side of rect
CG_INLINE CGPoint LFCGMidMinX(CGRect rect) {
    return CGPointMake(CGRectGetMinX(rect), CGRectGetMidY(rect));
}

/// Return middle of max X side of rectangle
//
//  Args:
//    rect - rectangle
//
//  Returns:
//    point located in the middle of max X side of rect
CG_INLINE CGPoint LFCGMidMaxX(CGRect rect) {
    return CGPointMake(CGRectGetMaxX(rect), CGRectGetMidY(rect));
}

/// Return middle of max Y side of rectangle
//
//  Args:
//    rect - rectangle
//
//  Returns:
//    point located in the middle of max Y side of rect
CG_INLINE CGPoint LFCGMidMaxY(CGRect rect) {
    return CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));
}

/// Return middle of min Y side of rectangle
//
//  Args:
//    rect - rectangle
//
//  Returns:
//    point located in the middle of min Y side of rect
CG_INLINE CGPoint LFCGMidMinY(CGRect rect) {
    return CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect));
}

/// Return center of rectangle
//
//  Args:
//    rect - rectangle
//
//  Returns:
//    point located in the center of rect
CG_INLINE CGPoint LFCGCenter(CGRect rect) {
    return CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
}

#pragma mark -
#pragma mark CG - Rect-Size Conversion

/// Return size of rectangle
//
//  Args:
//    rect - rectangle
//
//  Returns:
//    size of rectangle
CG_INLINE CGSize LFCGRectSize(CGRect rect) {
    return CGSizeMake(CGRectGetWidth(rect), CGRectGetHeight(rect));
}

/// Return rectangle of size
//
//  Args:
//    size - size
//
//  Returns:
//    rectangle of size (origin 0,0)
CG_INLINE CGRect LFCGRectOfSize(CGSize size) {
    return CGRectMake(0.0f, 0.0f, size.width, size.height);
}

#pragma mark -
#pragma mark CG - Rect Scaling and Alignment

///  Scales an CGRect
//
//  Args:
//    inRect: Rect to scale
//    xScale: fraction to scale (1.0 is 100%)
//    yScale: fraction to scale (1.0 is 100%)
//
//  Returns:
//    Converted Rect
CG_INLINE CGRect LFCGRectScale(CGRect inRect, CGFloat xScale, CGFloat yScale) {
    return CGRectMake(inRect.origin.x, inRect.origin.y,
                      inRect.size.width * xScale, inRect.size.height * yScale);
}


/// Align rectangles
//
//  Args:
//    alignee - rect to be aligned
//    aligner - rect to be aligned from
//    alignment - way to align the rectangles
CG_EXTERN CGRect LFCGAlignRectangles(CGRect alignee, CGRect aligner,
                            LFRectAlignment alignment);
/// Scale rectangle
//
//  Args:
//    scalee - rect to be scaled
//    size - size to scale to
//    scaling - way to scale the rectangle
CG_EXTERN CGRect LFCGScaleRectangleToSize(CGRect scalee, CGSize size,
                                 LFScaling scaling);

#pragma mark -
#pragma mark CG - Miscellaneous

/// Calculate the distance between two points.
//
//  Args:
//    pt1 first point
//    pt2 second point
//
//  Returns:
//    Distance
CG_INLINE CGFloat LFCGDistanceBetweenPoints(CGPoint pt1, CGPoint pt2) {
    CGFloat dX = pt1.x - pt2.x;
    CGFloat dY = pt1.y - pt2.y;
#if CGFLOAT_IS_DOUBLE
    return sqrt(dX * dX + dY * dY);
#else
    return sqrtf(dX * dX + dY * dY);
#endif
}