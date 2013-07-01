//
//  DKGeometry.h
//  DevKit
//
//  Created by Andrew Koslow on 22.01.13.
//  Copyright (c) 2012 Andrew Koslow. All rights reserved.
//

#ifndef DK_MACRO_GEOMETRY
#define DK_MACRO_GEOMETRY


#if (DK_MACRO_GEOMETRY_ENABLE + 0)

NS_INLINE CGRect DKRectSetMinX(CGRect rect, CGFloat minX) {
    CGFloat delta = minX - CGRectGetMinX(rect);
    rect.origin.x += delta;
    rect.size.width -= delta;
    
    return rect;
}


NS_INLINE CGRect DKRectSetMinY(CGRect rect, CGFloat minY) {
    CGFloat delta = minY - CGRectGetMinY(rect);
    rect.origin.y += delta;
    rect.size.height -= delta;
    
    return rect;
}


NS_INLINE CGRect DKRectSetMaxX(CGRect rect, CGFloat maxX) {
    CGFloat delta = maxX - CGRectGetMaxX(rect);
    rect.size.width += delta;
    
    return rect;
}


NS_INLINE CGRect DKRectSetMaxY(CGRect rect, CGFloat maxY) {
    CGFloat delta = maxY - CGRectGetMaxY(rect);
    rect.size.height += delta;
    
    return rect;
}


NS_INLINE CGRect DKRectSetMidX(CGRect rect, CGFloat midX) {
    CGFloat delta = midX - CGRectGetMidX(rect);
    rect.origin.x += delta;
    
    return rect;
}


NS_INLINE CGRect DKRectSetMidY(CGRect rect, CGFloat midY) {
    CGFloat delta = midY - CGRectGetMidY(rect);
    rect.origin.y += delta;
    
    return rect;
}


NS_INLINE CGRect DKRectSetWidth(CGRect rect, CGFloat width) {
    rect.size.width = width;
    
    return rect;
}


NS_INLINE CGRect DKRectSetHeight(CGRect rect, CGFloat height) {
    rect.size.height = height;
    
    return rect;
}


NS_INLINE CGRect DKRectSetLeft(CGRect rect, CGFloat left) {
    rect.origin.x = left;
    
    return rect;
}


NS_INLINE CGRect DKRectSetTop(CGRect rect, CGFloat top) {
    rect.origin.y = top;
    
    return rect;
}


NS_INLINE CGRect DKRectSetRight(CGRect rect, CGFloat right) {
    CGFloat delta = right - CGRectGetMaxX(rect);
    rect.origin.x += delta;
    
    return rect;
}


NS_INLINE CGRect DKRectSetBottom(CGRect rect, CGFloat bottom) {
    CGFloat delta = bottom - CGRectGetMaxX(rect);
    rect.origin.y += delta;
    
    return rect;
}


NS_INLINE CGRect DKRectSetOrigin(CGRect rect, CGPoint origin) {
    rect.origin = origin;
    
    return rect;
}


NS_INLINE CGRect DKRectSetSize(CGRect rect, CGSize size) {
    rect.size = size;
    
    return rect;
}


NS_INLINE CGRect DKRectMakeWithOriginAndSize(CGPoint origin, CGSize size) {
    CGRect rect;
    rect.origin = origin;
    rect.size = size;
    
    return rect;
}


NS_INLINE CGRect DKRectMakeWithOrigin(CGPoint origin) {
    CGRect rect;
    rect.origin = origin;
    rect.size = CGSizeZero;
    
    return rect;
}


NS_INLINE CGRect DKRectMakeWithSize(CGSize size) {
    CGRect rect;
    rect.origin = CGPointZero;
    rect.size = size;
    
    return rect;
}

#endif


#endif
