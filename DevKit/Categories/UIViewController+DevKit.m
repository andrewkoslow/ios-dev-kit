//
//  UIViewController+DevKit.m
//  DevKit
//
//  Created by Andrew Koslow on 18.12.12.
//  Copyright (c) 2012 Andrew Koslow. All rights reserved.
//

#if (DK_CATEGORIES_UI_VIEW_CONTROLLER_ENABLE + 0)


#if !(DK_MACRO_ASSERT_ENABLE + 0)
#error UIViewController (DevKit) requires DK_MACRO_ASSERT_ENABLE = 1
#endif

#if !(DK_MACRO_COMMON_ENABLE + 0)
#error UIViewController (DevKit) requires DK_MACRO_COMMON_ENABLE = 1
#endif


#if (DK_MACRO_ASSERT_ENABLE + 0) && (DK_MACRO_COMMON_ENABLE + 0)


#import "UIViewController+DevKit.h"
#import "DKAssert.h"
#import "DKCommon.h"


@implementation UIViewController (DevKit)


+ (id)viewController {
    return [[self alloc] initWithNibName:nil bundle:nil];
}


+ (id)viewControllerForCurrentInterfaceIdiom {
    static NSString *suffix = @"Controller";
    NSString *nibName = NSStringFromClass(self);
    if ([nibName hasSuffix:suffix] && nibName.length > suffix.length) nibName = [nibName substringToIndex:(nibName.length - suffix.length)];
    
    return [self viewControllerForCurrentInterfaceIdiomWithNibName:nibName bundle:nil];
}


+ (id)viewControllerForCurrentInterfaceIdiomWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    NSString *classNameSuffix = (UIUserInterfaceIdiomIsPad ? @"Pad" : @"Phone");
    NSString *className = NSStringFromClass(self);
    className = [className stringByAppendingString:classNameSuffix];
    
    Class class = NSClassFromString(className);
    DKAssertNotNil(class);
    
    return [[class alloc] initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
}


@end


#endif


#endif
