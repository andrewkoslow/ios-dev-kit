//
//  DKDebugger.h
//  DevKit
//
//  Created by Andrew Koslow on 29.05.13.
//  Copyright (c) 2013 Andrew Koslow. All rights reserved.
//


#ifndef DK_DEBUGGER_ENABLE
#define DK_DEBUGGER_ENABLE 0
#endif


#if DK_DEBUGGER_ENABLE

#ifndef DKConsoleLog
#define DKConsoleLog(format...) [[DKDebuggerConsole sharedConsole] logMessage:[NSString stringWithFormat:format]]
#else
#define DKConsoleLog(format...) do {} while (0)
#endif

#endif


#import "DKDebuggerController.h"
#import "DKDebuggerConsole.h"

