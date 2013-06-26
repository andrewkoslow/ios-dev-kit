//
//  NSUserDefaults+DevKit.h
//  DevKit
//
//  Created by Andrew Koslow on 19.02.13.
//  Copyright (c) 2012 Andrew Koslow. All rights reserved.
//

#if (DK_CATEGORIES_NS_USER_DEFAULTS_ENABLE + 0)


#import <Foundation/Foundation.h>


@interface NSUserDefaults (DevKit)

- (void)registerDefaultsFromFile:(NSString *)userDefaultsFileOrNil withExtension:(NSString *)extensionOrNil;

@end


#endif
