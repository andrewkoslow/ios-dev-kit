//
//  NSUserDefaults+DevKit.m
//  DevKit
//
//  Created by Andrew Koslow on 19.02.13.
//  Copyright (c) 2012 Andrew Koslow. All rights reserved.
//

#if (DK_CATEGORIES_NS_USER_DEFAULTS_ENABLE + 0)


#import "NSUserDefaults+DevKit.h"


@implementation NSUserDefaults (DevKit)


- (void)registerDefaultsFromFile:(NSString *)userDefaultsFileOrNil withExtension:(NSString *)extensionOrNil {
    userDefaultsFileOrNil = (userDefaultsFileOrNil ? userDefaultsFileOrNil : @"UserDefaults");
    extensionOrNil = (extensionOrNil ? extensionOrNil : @"plist");
    
    NSURL *defaultUserDefaultsFileURL = [[NSBundle mainBundle] URLForResource:userDefaultsFileOrNil withExtension:extensionOrNil];
    [self registerDefaults:[NSDictionary dictionaryWithContentsOfURL:defaultUserDefaultsFileURL]];
}


@end


#endif
