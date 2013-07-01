//
//  UIView+DevKit.m
//  DevKit
//
//  Created by Andrew Koslow on 22.01.13.
//  Copyright (c) 2012 Andrew Koslow. All rights reserved.
//

#if (DK_CATEGORIES_UI_VIEW_ENABLE + 0)


#if !(DK_MACRO_GEOMETRY_ENABLE + 0)
#error UIView (DevKit) requires DK_MACRO_GEOMETRY_ENABLE = 1
#endif


#if (DK_MACRO_GEOMETRY_ENABLE + 0)


#import "UIView+DevKit.h"
#import "DKGeometry.h"


@implementation UIView (DevKit)


#pragma mark - Frame based properties

- (CGFloat)width {
    return CGRectGetWidth(self.frame);
}


- (void)setWidth:(CGFloat)width {
    self.frame = DKRectSetWidth(self.frame, width);
}


- (CGFloat)height {
    return CGRectGetHeight(self.frame);
}


- (void)setHeight:(CGFloat)height {
    self.frame = DKRectSetHeight(self.frame, height);
}


- (CGFloat)left {
    return CGRectGetMinX(self.frame);
}


- (void)setLeft:(CGFloat)left {
    self.frame = DKRectSetLeft(self.frame, left);
}


- (CGFloat)top {
    return CGRectGetMinY(self.frame);
}


- (void)setTop:(CGFloat)top {
    self.frame = DKRectSetTop(self.frame, top);
}


- (CGFloat)right {
    return CGRectGetMaxX(self.frame);
}


- (void)setRight:(CGFloat)right {
    self.frame = DKRectSetRight(self.frame, right);
}


- (CGFloat)bottom {
    return CGRectGetMaxY(self.frame);
}


- (void)setBottom:(CGFloat)bottom {
    self.frame = DKRectSetBottom(self.frame, bottom);
}


- (CGFloat)minX {
    return CGRectGetMinX(self.frame);
}


- (void)setMinX:(CGFloat)minX {
    self.frame = DKRectSetMinX(self.frame, minX);
}


- (CGFloat)minY {
    return CGRectGetMinY(self.frame);
}


- (void)setMinY:(CGFloat)minY {
    self.frame = DKRectSetMinY(self.frame, minY);
}


- (CGFloat)maxX {
    return CGRectGetMaxX(self.frame);
}


- (void)setMaxX:(CGFloat)maxX {
    self.frame = DKRectSetMaxX(self.frame, maxX);
}


- (CGFloat)maxY {
    return CGRectGetMaxY(self.frame);
}


- (void)setMaxY:(CGFloat)maxY {
    self.frame = DKRectSetMaxY(self.frame, maxY);
}


- (CGFloat)midX {
    return CGRectGetMidX(self.frame);
}


- (void)setMidX:(CGFloat)midX {
    self.frame = DKRectSetMidX(self.frame, midX);
}


- (CGFloat)midY {
    return CGRectGetMidY(self.frame);
}


- (void)setMidY:(CGFloat)midY {
    self.frame = DKRectSetMidY(self.frame, midY);
}


- (CGPoint)origin {
    return self.frame.origin;
}


- (void)setOrigin:(CGPoint)origin {
    self.frame = DKRectSetOrigin(self.frame, origin);
}


- (CGSize)size {
    return self.frame.size;
}


- (void)setSize:(CGSize)size {
    self.frame = DKRectSetSize(self.frame, size);
}


#pragma mark - Bounds based properties

- (CGFloat)boundWidth {
    return CGRectGetWidth(self.bounds);
}


- (void)setBoundWidth:(CGFloat)width {
    self.bounds = DKRectSetWidth(self.bounds, width);
}


- (CGFloat)boundHeight {
    return CGRectGetHeight(self.bounds);
}


- (void)setBoundHeight:(CGFloat)height {
    self.bounds = DKRectSetHeight(self.bounds, height);
}


- (CGFloat)boundLeft {
    return CGRectGetMinX(self.bounds);
}


- (void)setBoundLeft:(CGFloat)boundLeft {
    self.bounds = DKRectSetLeft(self.bounds, boundLeft);
}


- (CGFloat)boundTop {
    return CGRectGetMinY(self.bounds);
}


- (void)setBoundTop:(CGFloat)boundTop {
    self.bounds = DKRectSetTop(self.bounds, boundTop);
}


- (CGFloat)boundRight {
    return CGRectGetMaxX(self.bounds);
}


- (void)setBoundRight:(CGFloat)boundRight {
    self.bounds = DKRectSetRight(self.bounds, boundRight);
}


- (CGFloat)boundBottom {
    return CGRectGetMaxY(self.bounds);
}


- (void)setBoundBottom:(CGFloat)boundBottom {
    self.bounds = DKRectSetBottom(self.bounds, boundBottom);
}


- (CGFloat)boundMinX {
    return CGRectGetMinX(self.bounds);
}


- (void)setBoundMinX:(CGFloat)minX {
    self.bounds = DKRectSetMinX(self.bounds, minX);
}


- (CGFloat)boundMinY {
    return CGRectGetMinY(self.bounds);
}


- (void)setBoundMinY:(CGFloat)minY {
    self.bounds = DKRectSetMinY(self.bounds, minY);
}


- (CGFloat)boundMaxX {
    return CGRectGetMaxX(self.bounds);
}


- (void)setBoundMaxX:(CGFloat)maxX {
    self.bounds = DKRectSetMaxX(self.bounds, maxX);
}


- (CGFloat)boundMaxY {
    return CGRectGetMaxY(self.bounds);
}


- (void)setBoundMaxY:(CGFloat)maxY {
    self.bounds = DKRectSetMaxY(self.bounds, maxY);
}


- (CGFloat)boundMidX {
    return CGRectGetMidX(self.bounds);
}


- (void)setBoundMidX:(CGFloat)midX {
    self.bounds = DKRectSetMidX(self.bounds, midX);
}


- (CGFloat)boundMidY {
    return CGRectGetMidY(self.bounds);
}


- (void)setBoundMidY:(CGFloat)midY {
    self.bounds = DKRectSetMidY(self.bounds, midY);
}


- (CGPoint)boundOrigin {
    return self.bounds.origin;
}


- (void)setBoundOrigin:(CGPoint)origin {
    self.bounds = DKRectSetOrigin(self.bounds, origin);
}


- (CGSize)boundSize {
    return self.bounds.size;
}


- (void)setBoundSize:(CGSize)size {
    self.bounds = DKRectSetSize(self.bounds, size);
}


@end


#endif


#endif
