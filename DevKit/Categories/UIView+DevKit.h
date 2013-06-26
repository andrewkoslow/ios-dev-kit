//
//  UIView+DevKit.h
//  DevKit
//
//  Created by Andrew Koslow on 22.01.13.
//  Copyright (c) 2012 Andrew Koslow. All rights reserved.
//

#if (DK_CATEGORIES_UI_VIEW_ENABLE + 0)


#import <Foundation/Foundation.h>


@interface UIView (DevKit)

@property (assign) CGFloat width;
@property (assign) CGFloat height;
@property (assign) CGFloat left;
@property (assign) CGFloat top;
@property (assign) CGFloat right;
@property (assign) CGFloat bottom;
@property (assign) CGFloat minX;
@property (assign) CGFloat minY;
@property (assign) CGFloat maxX;
@property (assign) CGFloat maxY;
@property (assign) CGFloat midX;
@property (assign) CGFloat midY;
@property (assign) CGPoint origin;
@property (assign) CGSize size;
@property (assign) CGFloat boundWidth;
@property (assign) CGFloat boundHeight;
@property (assign) CGFloat boundLeft;
@property (assign) CGFloat boundTop;
@property (assign) CGFloat boundRight;
@property (assign) CGFloat boundBottom;
@property (assign) CGFloat boundMinX;
@property (assign) CGFloat boundMinY;
@property (assign) CGFloat boundMaxX;
@property (assign) CGFloat boundMaxY;
@property (assign) CGFloat boundMidX;
@property (assign) CGFloat boundMidY;
@property (assign) CGPoint boundOrigin;
@property (assign) CGSize boundSize;

@end


#endif
