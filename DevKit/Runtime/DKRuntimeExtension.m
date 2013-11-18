//
//  DKRuntimeExtension.h
//  DevKit
//
//  Created by Andrew Koslow on 01.07.13.
//  Copyright (c) 2013 Andrew Koslow. All rights reserved.
//

#if (DK_RUNTIME_EXTENSION_ENABLE + 0)


#import <objc/runtime.h>
#import "DKRuntimeExtension.h"


void DKReplaceInstanceMethod(Class targetClass, SEL targetSelector, Class implementationClass, SEL implementationSelector) {
    Method targetMethod = class_getInstanceMethod(targetClass, targetSelector);
    Method implementationMethod = class_getInstanceMethod(implementationClass, implementationSelector);
    
    BOOL added = class_addMethod(targetClass, targetSelector, method_getImplementation(implementationMethod), method_getTypeEncoding(implementationMethod));
    
    if (added == NO) {
        method_exchangeImplementations(targetMethod, implementationMethod);
    }
}


#endif
