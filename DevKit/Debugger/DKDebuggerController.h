//
//  DKDebuggerController.h
//  DevKit
//
//  Created by Andrew Koslow on 29.05.13.
//  Copyright (c) 2013 Andrew Koslow. All rights reserved.
//


#if defined(DK_DEBUGGER_ENABLE) && DK_DEBUGGER_ENABLE


#import <UIKit/UIKit.h>


@interface DKDebuggerController : UITableViewController

+ (void)present;

@end


#endif
