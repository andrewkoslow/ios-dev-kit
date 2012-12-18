//
//  UIViewController+DevKit.m
//  DevKit
//
//  Created by Andrew Koslow on 18.12.12.
//  Copyright (c) 2012 Andrew Koslow. All rights reserved.
//

#import "UIViewController+DevKit.h"


@implementation UIViewController (DevKit)


+ (id)viewController {
    return [[[self alloc] initWithNibName:nil bundle:nil] autorelease];
}


+ (id)viewControllerForCurrentInterfaceIdiom {
    static NSString *suffix = @"Controller";
    NSString *nibName = NSStringFromClass(self);
    if ([nibName hasSuffix:suffix] && nibName.length > suffix.length) nibName = [nibName substringToIndex:(nibName.length - suffix.length)];
    
    return [self viewControllerForCurrentInterfaceIdiomWithNibName:nibName bundle:nil];
}


+ (id)viewControllerForCurrentInterfaceIdiomWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    NSString *classNameSuffix = (([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) ? @"Pad" : @"Phone");
    NSString *className = NSStringFromClass(self);
    className = [className stringByAppendingString:classNameSuffix];
    
    Class class = NSClassFromString(className);
    AWAssertNotNil(class);
    
    id controller = nil;
    
#if __has_feature(objc_arc)
    controller = [[class alloc] initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
#else
    controller = [[[class alloc] initWithNibName:nibNameOrNil bundle:nibBundleOrNil] autorelease];
#endif
    
    return controller;
}


@end
