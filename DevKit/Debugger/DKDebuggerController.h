//
//  DKDebuggerController.h
//  DevKit
//
//  Created by Andrew Koslow on 29.05.13.
//  Copyright (c) 2013 Andrew Koslow. All rights reserved.
//


#if defined(DK_ENABLE_DEBUGGER) && DK_ENABLE_DEBUGGER


#import <UIKit/UIKit.h>


@interface DKDebuggerController : UITableViewController

+ (void)present;

@end


#endif
