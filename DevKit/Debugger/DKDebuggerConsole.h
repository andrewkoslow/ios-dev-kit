//
//  DKDebuggerConsole.h
//  DevKit
//
//  Created by Andrew Koslow on 29.05.13.
//  Copyright (c) 2013 Andrew Koslow. All rights reserved.
//


#ifndef DKConsoleLog

#if (DK_DEBUGGER_ENABLE + 0)
#define DKConsoleLog(format...) [[DKDebuggerConsole sharedConsole] logMessage:[NSString stringWithFormat:format]]
#else
#define DKConsoleLog(format...) do {} while (0)
#endif

#endif


#if (DK_DEBUGGER_ENABLE + 0)


#import <Foundation/Foundation.h>


UIKIT_EXTERN NSString *const DKDebuggerConsoleDidUpdateLogNotification;


void DKDebuggerConsoleUncaughtExceptionHandler(NSException *exception);


typedef NSString *(^DKDebuggerConsoleLogFilePathGenerationBlock)(NSString *baseDirectoryPath);
typedef NSFileHandle *(^DKDebuggerConsoleLogFileHandleCreationBlock)(NSString *logFilePath);


@interface DKDebuggerConsole : NSObject

@property (readonly, retain) NSString *log;
@property (assign) BOOL logToFile;
@property (copy) DKDebuggerConsoleLogFilePathGenerationBlock logFilePathGenerationBlock;
@property (copy) DKDebuggerConsoleLogFileHandleCreationBlock logFileHandleCreationBlock;

+ (DKDebuggerConsole *)sharedConsole;
+ (void)setSharedConsole:(DKDebuggerConsole *)console;
- (void)logMessage:(NSString *)message;
- (void)clearLog;

@end


#endif
