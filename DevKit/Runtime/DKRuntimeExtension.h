//
//  DKRuntimeExtension.h
//  DevKit
//
//  Created by Andrew Koslow on 01.07.13.
//  Copyright (c) 2013 Andrew Koslow. All rights reserved.
//

#if (DK_RUNTIME_EXTENSION_ENABLE + 0)


#import <Foundation/Foundation.h>


void DKReplaceInstanceMethod(Class targetClass, SEL targetSelector, Class implementationClass, SEL implementationSelector);


#endif
