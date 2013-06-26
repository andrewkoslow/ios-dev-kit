//
//  UIDevice+DevKit.h
//  DevKit
//
//  Created by Andrew Koslow on 16.02.13.
//  Copyright (c) 2012 Andrew Koslow. All rights reserved.
//

#if (DK_CATEGORIES_UI_DEVICE_ENABLE + 0)


#import <UIKit/UIKit.h>


typedef struct DKSystemVersion {
    NSUInteger major;
    NSUInteger minor;
    NSUInteger revision;
} DKSystemVersion;


NS_INLINE DKSystemVersion DKSystemVersionMake(NSUInteger major, NSUInteger minor, NSUInteger revision) {
    DKSystemVersion v;
    v.major = major;
    v.minor = minor;
    v.revision = revision;
    
    return v;
}


@interface UIDevice (DevKit)

@property (readonly) DKSystemVersion systemVersionComponents;

- (BOOL)systemVersionGreaterThan:(DKSystemVersion)version;
- (BOOL)systemVersionGreaterThanOrEquals:(DKSystemVersion)version;
- (BOOL)systemVersionLowerThan:(DKSystemVersion)version;
- (BOOL)systemVersionLowerThanOrEquals:(DKSystemVersion)version;

@end


#endif
