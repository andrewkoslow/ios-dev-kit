//
//  DKDebuggerConsole.m
//  DevKit
//
//  Created by Andrew Koslow on 29.05.13.
//  Copyright (c) 2013 Andrew Koslow. All rights reserved.
//

#if (DK_DEBUGGER_ENABLE + 0)


#import "DKDebuggerConsole.h"
#import <mach/mach.h>
#import <pthread.h>


NSString *const DKDebuggerConsoleDidUpdateLogNotification = @"DKDebuggerConsoleDidUpdateLogNotification";


void DKDebuggerConsoleUncaughtExceptionHandler(NSException *exception) {
    NSString *callStackReturnAddressesMessage = [NSString stringWithFormat:@"*** Terminating app due to uncaught exception '%@', reason: '%@'\n*** Call stack symbols:\n%@",
                                                 NSStringFromClass(exception.class),
                                                 exception.reason,
                                                 exception.callStackSymbols];
    
    [[DKDebuggerConsole sharedConsole] logMessage:callStackReturnAddressesMessage];
}


@interface DKDebuggerConsole ()

@property (readwrite, retain) NSString *log;
@property (retain) NSFileHandle *logFileHandle;

@end


@implementation DKDebuggerConsole


static __strong DKDebuggerConsole *sharedConsole = nil;


+ (void)initialize {
#if (DK_DEBUGGER_CONSOLE_AUTO_CREATE_SHARED + 0)
    
    sharedConsole = [self new];
    
#endif
}


+ (DKDebuggerConsole *)sharedConsole {
    return sharedConsole;
}


+ (void)setSharedConsole:(DKDebuggerConsole *)console {
    sharedConsole = console;
}


- (id)init {
    if ((self = [super init])) {
        
#if (DK_DEBUGGER_CONSOLE_LOG_TO_FILE + 0)
        _logToFile = YES;
#endif
        _logFilePathGenerationBlock = ^(NSString *baseDirectoryPath) {
            static NSDateFormatter *dateFormatter = nil;
            static dispatch_once_t onceToken;
            dispatch_once(&onceToken, ^{
                dateFormatter = [NSDateFormatter new];
                dateFormatter.dateFormat = @"yyyy-MM-dd-HHmmss";
            });
            
            NSProcessInfo *processInfo = [NSProcessInfo processInfo];
            NSString *fileName = [NSString stringWithFormat:@"%@_%@_%@.log", processInfo.processName, [dateFormatter stringFromDate:[NSDate date]], processInfo.hostName];
            
            return [baseDirectoryPath stringByAppendingPathComponent:fileName];
        };
        
        _logFileHandleCreationBlock = ^(NSString *logFilePath) {
            [[NSFileManager defaultManager] createDirectoryAtPath:[logFilePath stringByDeletingLastPathComponent] withIntermediateDirectories:YES attributes:nil error:nil];
            
            BOOL exists = [[NSFileManager defaultManager] fileExistsAtPath:logFilePath];
            if (exists == NO) {
                [[NSFileManager defaultManager] createFileAtPath:logFilePath contents:nil attributes:nil];
            }
            
            NSFileHandle *logFileHandle = [NSFileHandle fileHandleForWritingAtPath:logFilePath];
            [logFileHandle seekToEndOfFile];
            
            return logFileHandle;
        };
        
        _log = @"";
    }
    return self;
}


- (void)notifyDidUpdateLog {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self performSelector:@selector(postDidUpdateLogNotification) withObject:nil afterDelay:0.0];
    });
}


- (void)postDidUpdateLogNotification {
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:_cmd object:nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:DKDebuggerConsoleDidUpdateLogNotification object:self];
}


- (void)logMessage:(NSString *)message {
    @synchronized(self) {
        static __strong NSDateFormatter *dateFormatter = nil;
        static __strong NSProcessInfo *processInfo = nil;
        
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            dateFormatter = [NSDateFormatter new];
            dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss.SSS";
            
            processInfo = [NSProcessInfo processInfo];
        });
        
        thread_act_t machThreadID = mach_thread_self();
        NSString *prefix = [NSString stringWithFormat:@"%@ %@[%d:%x] ", [dateFormatter stringFromDate:[NSDate date]], processInfo.processName, processInfo.processIdentifier, machThreadID];
        
        message = [prefix stringByAppendingString:message];
        message = [message stringByAppendingString:@"\n"];
        
        if (self.logToFile) {
            if (self.logFileHandle == nil) {
                [self openLogFile];
                
                NSString *sessionMessage = [@"" stringByPaddingToLength:80 withString:@"-" startingAtIndex:0];
                sessionMessage = [sessionMessage stringByAppendingString:@"\n"];
                sessionMessage = [sessionMessage stringByAppendingString:prefix];
                sessionMessage = [sessionMessage stringByAppendingString:@"New Log Started\n\n"];
                
                [self logMessageToLogFile:sessionMessage];
            }
        }
        
        if (self.logToFile) {
            [self logMessageToLogFile:message];
        }
        
        self.log = [self.log stringByAppendingString:message];
        [self notifyDidUpdateLog];
    }
}


- (void)openLogFile {
    NSString *logFilePath = self.logFilePathGenerationBlock(NSTemporaryDirectory());
    
    self.logFileHandle = self.logFileHandleCreationBlock(logFilePath);
}


- (void)logMessageToLogFile:(NSString *)message {
    if (self.logFileHandle) {
        @try {
            [self.logFileHandle writeData:[message dataUsingEncoding:NSUTF8StringEncoding]];
            [self.logFileHandle synchronizeFile];
            
        } @catch (NSException *exception) {
            self.logFileHandle = nil;
        }
    }
    
    self.logToFile = (self.logFileHandle != nil);
}


- (void)clearLog {
    self.log = @"";
    
    [self notifyDidUpdateLog];
}


@end


#endif
