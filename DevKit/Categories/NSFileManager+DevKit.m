//
//  NSFileManager+DevKit.m
//  DevKit
//
//  Created by Andrew Koslow on 12.01.13.
//  Copyright (c) 2012 Andrew Koslow. All rights reserved.
//

#if (DK_CATEGORIES_NS_FILE_MANAGER_ENABLE + 0)


#if !(DK_CATEGORIES_NS_ARRAY_ENABLE + 0)
#error NSFileManager (DevKit) requires DK_CATEGORIES_NS_ARRAY_ENABLE = 1
#endif


#if (DK_CATEGORIES_NS_ARRAY_ENABLE + 0)


#import "NSFileManager+DevKit.h"
#import "NSArray+DevKit.h"


@implementation NSFileManager (DevKit)


+ (NSURL *)userLibraryDirectoryURL {
    return [[self defaultManager] URLsForDirectory:NSLibraryDirectory inDomains:NSUserDomainMask].firstObject;
}


+ (NSURL *)userCacheDirectoryURL {
    return [[self defaultManager] URLsForDirectory:NSCachesDirectory inDomains:NSUserDomainMask].firstObject;
}


@end


#endif


#endif
