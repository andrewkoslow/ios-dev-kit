//
//  NSObject+DevKit.m
//  DevKit
//
//  Created by Andrew Koslow on 16.12.12.
//  Copyright (c) 2012 Andrew Koslow. All rights reserved.
//

#if (DK_CATEGORIES_NS_OBJECT_ENABLE + 0)


#if !(DK_MACRO_ASSERT_ENABLE + 0)
#error NSObject (DevKit) requires DK_MACRO_ASSERT_ENABLE = 1
#endif


#if (DK_MACRO_ASSERT_ENABLE + 0)


#import "NSObject+DevKit.h"
#import "DKAssert.h"


@interface NSObject (DevKitPrivate)

- (void)observeNotificationsForObject:(id)object name:(NSString *)name namesVA:(va_list)names;
- (void)observeWithSelector:(SEL)selector notificationsForObject:(id)object name:(NSString *)name namesVA:(va_list)names;
- (void)stopObservingNotificationsForObject:(id)object name:(NSString *)name namesVA:(va_list)names;

@end


@implementation NSObject (DevKit)


+ (id)object {
    return [self new];
}


#pragma mark - Key Path Observation

- (void)observeKeyPaths:(NSString *)keyPath, ... {
    va_list keyPaths;
    va_start(keyPaths, keyPath);
    
    for (; keyPath != nil; keyPath = va_arg(keyPaths, NSString *)) {
        [self addObserver:self forKeyPath:keyPath options:NSKeyValueObservingOptionOld context:nil];
    }
    
    va_end(keyPaths);
}


- (void)stopObservingKeyPaths:(NSString *)keyPath, ... {
    va_list keyPaths;
    va_start(keyPaths, keyPath);
    
    for (; keyPath != nil; keyPath = va_arg(keyPaths, NSString *)) {
        [self removeObserver:self forKeyPath:keyPath];
    }
    
    va_end(keyPaths);
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (object == self) {
        NSArray *components = [keyPath componentsSeparatedByString:@"."];
        NSString *firstPart = components[0];
        NSMutableString *proposedMethodName = [NSMutableString stringWithString:firstPart];
        
        for (NSUInteger i = 1; i < components.count; i++) {
            NSString *part = components[i];
            [proposedMethodName appendString:[[part substringToIndex:1] uppercaseString]];
            [proposedMethodName appendString:[part substringFromIndex:1]];
        }
        
        [proposedMethodName appendString:@"Change"];
        
        SEL selector = NSSelectorFromString(proposedMethodName);
        if ([self respondsToSelector:selector]) {
            [self performSelector:selector withObject:nil afterDelay:0];
            
        } else {
            [proposedMethodName appendString:@":"];
            
            selector = NSSelectorFromString(proposedMethodName);
            if ([self respondsToSelector:selector]) {
                [self performSelector:selector withObject:change afterDelay:0];
            }
        }
    }
}


#pragma mark - Notification Observation With Automatic Selector Resolution

- (void)observeNotificationsNames:(NSString *)name, ... {
    va_list args;
    va_start(args, name);
    
    [self observeNotificationsForObject:nil name:name namesVA:args];
    
    va_end(args);
}


- (void)observeNotificationsForObject:(id)object names:(NSString *)name, ... {
    va_list args;
    va_start(args, name);
    
    [self observeNotificationsForObject:object name:name namesVA:args];
    
    va_end(args);
}


- (void)observeNotificationsForObject:(id)object name:(NSString *)name namesVA:(va_list)names {
    NSString *suffix = @"Notification";
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    
    for (; name != nil; name = va_arg(names, NSString *)) {
        NSString *proposedSelector = nil;
        
        if (name.length > suffix.length && [name hasSuffix:suffix]) {
            NSScanner *scanner = [NSScanner scannerWithString:name];
            scanner.caseSensitive = YES;
            
            NSString *prefix = nil;
            BOOL result = [scanner scanCharactersFromSet:[NSCharacterSet uppercaseLetterCharacterSet] intoString:&prefix];
            if (result) proposedSelector = [name substringFromIndex:(prefix.length - 1)];
            
            if (proposedSelector.length > suffix.length) {
                NSString *lowercasedFirstCharacter = [[proposedSelector substringToIndex:1] lowercaseString];
                NSString *remainingPart = [proposedSelector substringFromIndex:1];
                remainingPart = [remainingPart substringToIndex:(remainingPart.length - suffix.length)];
                proposedSelector = [lowercasedFirstCharacter stringByAppendingString:remainingPart];
            }
            
            if (proposedSelector.length == 0) proposedSelector = nil;
        }
        
        SEL selector = NSSelectorFromString(proposedSelector);
        if ([self respondsToSelector:selector] == NO) {
            proposedSelector = [proposedSelector stringByAppendingString:@":"];
            selector = NSSelectorFromString(proposedSelector);
        }
        
        DKAssertResponds(self, selector);
        
        [center addObserver:self selector:selector name:name object:object];
    }
}


#pragma mark - Notification Observation

- (void)observeWithSelector:(SEL)selector notificationsNames:(NSString *)name, ... {
    va_list args;
    va_start(args, name);
    
    [self observeWithSelector:selector notificationsForObject:nil name:name namesVA:args];
    
    va_end(args);
}


- (void)observeWithSelector:(SEL)selector notificationsForObject:(id)object names:(NSString *)name, ... {
    va_list args;
    va_start(args, name);
    
    [self observeWithSelector:selector notificationsForObject:object name:name namesVA:args];
    
    va_end(args);
}


- (void)observeWithSelector:(SEL)selector notificationsForObject:(id)object name:(NSString *)name namesVA:(va_list)names {
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    
    for (; name != nil; name = va_arg(names, NSString *)) {
        DKAssertResponds(self, selector);
        [center addObserver:self selector:selector name:name object:object];
    }
}


- (void)stopObservingNotificationsNames:(NSString *)name, ... {
    va_list names;
    va_start(names, name);
    
	[self stopObservingNotificationsForObject:nil name:name namesVA:names];
    
    va_end(names);
}


- (void)stopObservingNotificationsForObject:(id)object names:(NSString *)name, ... {
    va_list names;
    va_start(names, name);
    
	[self stopObservingNotificationsForObject:object name:name namesVA:names];
    
    va_end(names);
}


- (void)stopObservingNotificationsForObject:(id)object name:(NSString *)name namesVA:(va_list)names {
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    
    for (; name != nil; name = va_arg(names, NSString *)) {
        [center removeObserver:self name:name object:object];
    }
}


- (void)stopObservingNotifications {
	[[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end


#endif


#endif
