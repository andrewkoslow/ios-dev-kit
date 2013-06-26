//
//  UIDevice+DevKit.m
//  DevKit
//
//  Created by Andrew Koslow on 16.02.13.
//  Copyright (c) 2012 Andrew Koslow. All rights reserved.
//

#if (DK_CATEGORIES_UI_DEVICE_ENABLE + 0)


#import "UIDevice+DevKit.h"


@implementation UIDevice (DevKit)


- (DKSystemVersion)systemVersionComponents {
    static DKSystemVersion systemVersionComponents;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSArray *versionComponents = [[UIDevice currentDevice].systemVersion componentsSeparatedByString:@"."];
        
        if (versionComponents.count > 0) {
            NSString *major = versionComponents[0];
            systemVersionComponents.major = (NSUInteger)major.integerValue;
            
        } else systemVersionComponents.major = 0;
        
        if (versionComponents.count > 1) {
            NSString *minor = versionComponents[1];
            systemVersionComponents.minor = (NSUInteger)minor.integerValue;
            
        } else systemVersionComponents.minor = 0;
        
        if (versionComponents.count > 2) {
            NSString *revision = versionComponents[2];
            systemVersionComponents.revision = (NSUInteger)revision.integerValue;
            
        } else systemVersionComponents.revision = 0;
    });
    
    return systemVersionComponents;
}


- (BOOL)systemVersionGreaterThan:(DKSystemVersion)comparing {
    DKSystemVersion system = self.systemVersionComponents;
    return (system.major > comparing.major
            || (system.major == comparing.major && system.minor > comparing.minor)
            || (system.major == comparing.major && system.minor == comparing.minor && system.revision > comparing.revision));
}


- (BOOL)systemVersionGreaterThanOrEquals:(DKSystemVersion)comparing {
    DKSystemVersion system = self.systemVersionComponents;
    return ([self systemVersionGreaterThan:comparing]
            || (system.major == comparing.major && system.minor == comparing.minor && system.revision == comparing.revision));
}


- (BOOL)systemVersionLowerThan:(DKSystemVersion)comparing {
    DKSystemVersion system = self.systemVersionComponents;
    return (system.major < comparing.major
            || (system.major == comparing.major && system.minor < comparing.minor)
            || (system.major == comparing.major && system.minor == comparing.minor && system.revision < comparing.revision));
}


- (BOOL)systemVersionLowerThanOrEquals:(DKSystemVersion)comparing {
    DKSystemVersion system = self.systemVersionComponents;
    return ([self systemVersionLowerThan:comparing]
            || (system.major == comparing.major && system.minor == comparing.minor && system.revision == comparing.revision));
}


@end


#endif
