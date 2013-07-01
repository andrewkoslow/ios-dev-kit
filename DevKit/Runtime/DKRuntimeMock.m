//
//  DKRuntimeMock.h
//  DevKit
//
//  Created by Andrew Koslow on 01.07.13.
//  Copyright (c) 2013 Andrew Koslow. All rights reserved.
//

#if (DK_RUNTIME_MOCK_ENABLE + 0)


#if !(DK_RUNTIME_EXTENSION_ENABLE + 0)
#error DKRuntimeMock requires DK_RUNTIME_EXTENSION_ENABLE = 1
#endif


#if (DK_RUNTIME_EXTENSION_ENABLE + 0)


#import "DKRuntimeMock.h"
#import <objc/runtime.h>
#import "DKRuntimeExtension.h"


void DKMockInstance(Class targetClass, Class mockClass) {
    DKMockInstanceWithMethodNamePrefix(targetClass, mockClass, @"__mock__");
}


void DKMockInstanceWithMethodNamePrefix(Class targetClass, Class mockClass, NSString *methodNamePrefix) {
    unsigned int methodListCount = 0;
    Method *methodList = class_copyMethodList(mockClass, &methodListCount);
    
    for (unsigned int i = 0; i < methodListCount; i++) {
        Method method = methodList[i];
        SEL mockSelector = method_getName(method);
        NSString *mockMethodName = NSStringFromSelector(mockSelector);
        
        SEL targetSelector = nil;
        NSString *targetMethodName = nil;
        
        if ([mockMethodName hasPrefix:methodNamePrefix]) {
            targetMethodName = [mockMethodName substringFromIndex:methodNamePrefix.length];
            
            if (targetMethodName.length) {
                targetSelector = NSSelectorFromString(targetMethodName);
            }
        }
        
        DKReplaceInstanceMethod(targetClass, targetSelector, mockClass, mockSelector);
    }
    
    if (methodList) free(methodList);
}


#endif


#endif
