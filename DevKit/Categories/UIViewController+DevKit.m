//
//  UIViewController+DevKit.m
//  DevKit
//
//  Created by Andrew Koslow on 18.12.12.
//  Copyright (c) 2012 Andrew Koslow. All rights reserved.
//

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
