//
//  UIViewController+DevKit.h
//  DevKit
//
//  Created by Andrew Koslow on 18.12.12.
//  Copyright (c) 2012 Andrew Koslow. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIViewController (DevKit)

+ (id)viewControllerForCurrentInterfaceIdiom;
+ (id)viewControllerForCurrentInterfaceIdiomWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;

@end
