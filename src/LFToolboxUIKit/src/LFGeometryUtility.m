//
//  LFGeometryUtils.m
//  LaiFeng
//
//  Created by wangxiaoxiang on 16/6/8.
//  Copyright © 2016年 live Interactive. All rights reserved.
//

#import "LFGeometryUtility.h"

CGRect LFCGAlignRectangles(CGRect alignee, CGRect aligner, LFRectAlignment alignment) {
    switch (alignment) {
        case LFRectAlignTop:
            alignee.origin.x = aligner.origin.x + (CGRectGetWidth(aligner) * .5f - CGRectGetWidth(alignee) * .5f);
            alignee.origin.y = aligner.origin.y + CGRectGetHeight(aligner) - CGRectGetHeight(alignee);
            break;
            
        case LFRectAlignTopLeft:
            alignee.origin.x = aligner.origin.x;
            alignee.origin.y = aligner.origin.y + CGRectGetHeight(aligner) - CGRectGetHeight(alignee);
            break;
            
        case LFRectAlignTopRight:
            alignee.origin.x = aligner.origin.x + CGRectGetWidth(aligner) - CGRectGetWidth(alignee);
            alignee.origin.y = aligner.origin.y + CGRectGetHeight(aligner) - CGRectGetHeight(alignee);
            break;
            
        case LFRectAlignLeft:
            alignee.origin.x = aligner.origin.x;
            alignee.origin.y = aligner.origin.y + (CGRectGetHeight(aligner) * .5f - CGRectGetHeight(alignee) * .5f);
            break;
            
        case LFRectAlignBottomLeft:
            alignee.origin.x = aligner.origin.x;
            alignee.origin.y = aligner.origin.y;
            break;
            
        case LFRectAlignBottom:
            alignee.origin.x = aligner.origin.x + (CGRectGetWidth(aligner) * .5f - CGRectGetWidth(alignee) * .5f);
            alignee.origin.y = aligner.origin.y;
            break;
            
        case LFRectAlignBottomRight:
            alignee.origin.x = aligner.origin.x + CGRectGetWidth(aligner) - CGRectGetWidth(alignee);
            alignee.origin.y = aligner.origin.y;
            break;
            
        case LFRectAlignRight:
            alignee.origin.x = aligner.origin.x + CGRectGetWidth(aligner) - CGRectGetWidth(alignee);
            alignee.origin.y = aligner.origin.y + (CGRectGetHeight(aligner) * .5f - CGRectGetHeight(alignee) * .5f);
            break;
            
        default:
        case LFRectAlignCenter:
            alignee.origin.x = aligner.origin.x + (CGRectGetWidth(aligner) * .5f - CGRectGetWidth(alignee) * .5f);
            alignee.origin.y = aligner.origin.y + (CGRectGetHeight(aligner) * .5f - CGRectGetHeight(alignee) * .5f);
            break;
    }
    return alignee;
}

CGRect LFCGScaleRectangleToSize(CGRect scalee, CGSize size, LFScaling scaling) {
    switch (scaling) {
            
        case LFScaleToFillProportionally:
        case LFScaleProportionally: {
            CGFloat height = CGRectGetHeight(scalee);
            CGFloat width = CGRectGetWidth(scalee);
            if (isnormal(height) && isnormal(width) &&
                (height > size.height || width > size.width)) {
                CGFloat horiz = size.width / width;
                CGFloat vert = size.height / height;
                BOOL expand = (scaling == LFScaleToFillProportionally);
                // We use the smaller scale unless expand is true. In that case, larger.
                CGFloat newScale = ((horiz < vert) ^ expand) ? horiz : vert;
                scalee = LFCGRectScale(scalee, newScale, newScale);
            }
            break;
        }
            
        case LFScaleToFit:
            scalee.size = size;
            break;
            
        case LFScaleNone:
        default:
            // Do nothing
            break;
    }
    return scalee;
}