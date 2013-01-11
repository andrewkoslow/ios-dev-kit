//
//  UIViewController+DevKit.m
//  DevKit
//
//  Created by Andrew Koslow on 18.12.12.
//  Copyright (c) 2012 Andrew Koslow. All rights reserved.
//

#import "UIViewController+DevKit.h"
#import "DKCommon.h"


@implementation UIViewController (DevKit)


+ (id)viewController {
#if __has_feature(objc_arc)
    return [[self alloc] initWithNibName:nil bundle:nil];
#else
    return [[[self alloc] initWithNibName:nil bundle:nil] autorelease];
#endif
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
    
    id controller = nil;
    
#if __has_feature(objc_arc)
    controller = [[class alloc] initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
#else
    controller = [[[class alloc] initWithNibName:nibNameOrNil bundle:nibBundleOrNil] autorelease];
#endif
    
    return controller;
}


@end
