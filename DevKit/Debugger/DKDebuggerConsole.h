//
//  DKDebuggerConsole.h
//  DevKit
//
//  Created by Andrew Koslow on 29.05.13.
//  Copyright (c) 2013 Andrew Koslow. All rights reserved.
//


#if defined(DK_DEBUGGER_ENABLE) && DK_DEBUGGER_ENABLE


#import <Foundation/Foundation.h>


#ifndef DK_DEBUGGER_CONSOLE_AUTO_CREATE_SHARED
#define DK_DEBUGGER_CONSOLE_AUTO_CREATE_SHARED 1
#endif


#ifndef DK_DEBUGGER_CONSOLE_LOG_TO_FILE
#define DK_DEBUGGER_CONSOLE_LOG_TO_FILE 0
#endif


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
