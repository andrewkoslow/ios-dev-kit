//
//  UIView+DevKit.m
//  DevKit
//
//  Created by Andrew Koslow on 22.01.13.
//  Copyright (c) 2012 Andrew Koslow. All rights reserved.
//

#import "UIView+DevKit.h"
#import "DKGeometry.h"


@implementation UIView (DevKit)


#pragma mark - Frame based properties

- (CGFloat)width {
    return CGRectGetWidth(self.frame);
}


- (void)setWidth:(CGFloat)width {
    self.frame = CGRectSetWidth(self.frame, width);
}


- (CGFloat)height {
    return CGRectGetHeight(self.frame);
}


- (void)setHeight:(CGFloat)height {
    self.frame = CGRectSetHeight(self.frame, height);
}


- (CGFloat)x {
    return self.frame.origin.x;
}


- (void)setX:(CGFloat)x {
    self.frame = CGRectSetX(self.frame, x);
}


- (CGFloat)y {
    return self.frame.origin.y;
}


- (void)setY:(CGFloat)y {
    self.frame = CGRectSetY(self.frame, y);
}


- (CGFloat)minX {
    return CGRectGetMinX(self.frame);
}


- (void)setMinX:(CGFloat)minX {
    self.frame = CGRectSetMinX(self.frame, minX);
}


- (CGFloat)minY {
    return CGRectGetMinY(self.frame);
}


- (void)setMinY:(CGFloat)minY {
    self.frame = CGRectSetMinY(self.frame, minY);
}


- (CGFloat)maxX {
    return CGRectGetMaxX(self.frame);
}


- (void)setMaxX:(CGFloat)maxX {
    self.frame = CGRectSetMaxX(self.frame, maxX);
}


- (CGFloat)maxY {
    return CGRectGetMaxY(self.frame);
}


- (void)setMaxY:(CGFloat)maxY {
    self.frame = CGRectSetMaxY(self.frame, maxY);
}


- (CGFloat)midX {
    return CGRectGetMidX(self.frame);
}


- (void)setMidX:(CGFloat)midX {
    self.frame = CGRectSetMidX(self.frame, midX);
}


- (CGFloat)midY {
    return CGRectGetMidY(self.frame);
}


- (void)setMidY:(CGFloat)midY {
    self.frame = CGRectSetMidY(self.frame, midY);
}


- (CGPoint)origin {
    return self.frame.origin;
}


- (void)setOrigin:(CGPoint)origin {
    self.frame = CGRectSetOrigin(self.frame, origin);
}


- (CGSize)size {
    return self.frame.size;
}


- (void)setSize:(CGSize)size {
    self.frame = CGRectSetSize(self.frame, size);
}


#pragma mark - Bounds based properties

- (CGFloat)boundWidth {
    return CGRectGetWidth(self.bounds);
}


- (void)setBoundWidth:(CGFloat)width {
    self.bounds = CGRectSetWidth(self.bounds, width);
}


- (CGFloat)boundHeight {
    return CGRectGetHeight(self.bounds);
}


- (void)setBoundHeight:(CGFloat)height {
    self.bounds = CGRectSetHeight(self.bounds, height);
}


- (CGFloat)boundX {
    return self.bounds.origin.x;
}


- (void)setBoundX:(CGFloat)x {
    self.bounds = CGRectSetX(self.bounds, x);
}


- (CGFloat)boundY {
    return self.bounds.origin.y;
}


- (void)setBoundY:(CGFloat)y {
    self.bounds = CGRectSetY(self.bounds, y);
}


- (CGFloat)boundMinX {
    return CGRectGetMinX(self.bounds);
}


- (void)setBoundMinX:(CGFloat)minX {
    self.bounds = CGRectSetMinX(self.bounds, minX);
}


- (CGFloat)boundMinY {
    return CGRectGetMinY(self.bounds);
}


- (void)setBoundMinY:(CGFloat)minY {
    self.bounds = CGRectSetMinY(self.bounds, minY);
}


- (CGFloat)boundMaxX {
    return CGRectGetMaxX(self.bounds);
}


- (void)setBoundMaxX:(CGFloat)maxX {
    self.bounds = CGRectSetMaxX(self.bounds, maxX);
}


- (CGFloat)boundMaxY {
    return CGRectGetMaxY(self.bounds);
}


- (void)setBoundMaxY:(CGFloat)maxY {
    self.bounds = CGRectSetMaxY(self.bounds, maxY);
}


- (CGFloat)boundMidX {
    return CGRectGetMidX(self.bounds);
}


- (void)setBoundMidX:(CGFloat)midX {
    self.bounds = CGRectSetMidX(self.bounds, midX);
}


- (CGFloat)boundMidY {
    return CGRectGetMidY(self.bounds);
}


- (void)setBoundMidY:(CGFloat)midY {
    self.bounds = CGRectSetMidY(self.bounds, midY);
}


- (CGPoint)boundOrigin {
    return self.bounds.origin;
}


- (void)setBoundOrigin:(CGPoint)origin {
    self.bounds = CGRectSetOrigin(self.bounds, origin);
}


- (CGSize)boundSize {
    return self.bounds.size;
}


- (void)setBoundSize:(CGSize)size {
    self.bounds = CGRectSetSize(self.bounds, size);
}


@end
