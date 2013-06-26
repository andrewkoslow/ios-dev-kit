//
//  NSFileManager+DevKit.h
//  DevKit
//
//  Created by Andrew Koslow on 12.01.13.
//  Copyright (c) 2012 Andrew Koslow. All rights reserved.
//

#if (DK_CATEGORIES_NS_FILE_MANAGER_ENABLE + 0)


#import <Foundation/Foundation.h>


@interface NSFileManager (DevKit)

+ (NSURL *)userLibraryDirectoryURL;
+ (NSURL *)userCacheDirectoryURL;

@end


#endif
