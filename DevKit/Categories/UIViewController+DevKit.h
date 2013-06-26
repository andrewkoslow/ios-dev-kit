//
//  UIViewController+DevKit.h
//  DevKit
//
//  Created by Andrew Koslow on 18.12.12.
//  Copyright (c) 2012 Andrew Koslow. All rights reserved.
//

#if (DK_CATEGORIES_UI_VIEW_CONTROLLER_ENABLE + 0)


#import <UIKit/UIKit.h>


@interface UIViewController (DevKit)

+ (id)viewController;
+ (id)viewControllerForCurrentInterfaceIdiom;
+ (id)viewControllerForCurrentInterfaceIdiomWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;

@end


#endif
