//
//  DKDebuggerConsole.m
//  DevKit
//
//  Created by Andrew Koslow on 29.05.13.
//  Copyright (c) 2013 Andrew Koslow. All rights reserved.
//

#if defined(DK_DEBUGGER_ENABLE) && DK_DEBUGGER_ENABLE


#include <mach/mach.h>
#include <pthread.h>
#import "DKDebuggerConsole.h"


NSString *const DKDebuggerConsoleDidUpdateLogNotification = @"DKDebuggerConsoleDidUpdateLogNotification";


@interface DKDebuggerConsole ()

@property (readwrite, retain) NSString *log;

@end


@implementation DKDebuggerConsole


+ (DKDebuggerConsole *)sharedConsole {
    static DKDebuggerConsole *sharedConsole = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedConsole = [[self class] new];
    });
    
    return sharedConsole;
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
    @autoreleasepool {
        NSProcessInfo *processInfo = [NSProcessInfo processInfo];
        thread_act_t machThreadID = mach_thread_self();
        
        NSString *log = self.log;
        if (log == nil) log = @"";
        if (log.length) log = [log stringByAppendingString:@"\n"];
        
        static NSDateFormatter *dateFormatter = nil;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            dateFormatter = [NSDateFormatter new];
            dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss.SSS";
        });
        
        self.log = [log stringByAppendingFormat:@"%@ %@[%d:%x] %@", [dateFormatter stringFromDate:[NSDate date]], processInfo.processName, processInfo.processIdentifier, machThreadID, message];
    }
    
    [self notifyDidUpdateLog];
}


- (void)clearLog {
    self.log = @"";
    
    [self notifyDidUpdateLog];
}


@end


#endif
