//
//  DKDebuggerConsole.h
//  DevKit
//
//  Created by Andrew Koslow on 29.05.13.
//  Copyright (c) 2013 Andrew Koslow. All rights reserved.
//


#ifndef DKConsoleLog

#if defined(DK_DEBUGGER_ENABLE) && DK_DEBUGGER_ENABLE
#define DKConsoleLog(format...) [[DKDebuggerConsole sharedConsole] logMessage:[NSString stringWithFormat:format]]
#else
#define DKConsoleLog(format...) do {} while (0)
#endif

#endif


#if defined(DK_DEBUGGER_ENABLE) && DK_DEBUGGER_ENABLE


#import <Foundation/Foundation.h>


UIKIT_EXTERN NSString *const DKDebuggerConsoleDidUpdateLogNotification;


@interface DKDebuggerConsole : NSObject

@property (readonly, retain) NSString *log;

+ (DKDebuggerConsole *)sharedConsole;
- (void)logMessage:(NSString *)message;
- (void)clearLog;

@end


#endif
