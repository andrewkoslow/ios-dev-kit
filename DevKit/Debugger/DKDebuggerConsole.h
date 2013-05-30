//
//  DKDebuggerConsole.h
//  DevKit
//
//  Created by Andrew Koslow on 29.05.13.
//  Copyright (c) 2013 Andrew Koslow. All rights reserved.
//


#if defined(DK_ENABLE_DEBUGGER) && DK_ENABLE_DEBUGGER


#import <Foundation/Foundation.h>


UIKIT_EXTERN NSString *const DKDebuggerConsoleDidUpdateLogNotification;


@interface DKDebuggerConsole : NSObject

@property (readonly, retain) NSString *log;

+ (DKDebuggerConsole *)sharedConsole;
- (void)logMessage:(NSString *)message;
- (void)clearLog;

@end


#endif
