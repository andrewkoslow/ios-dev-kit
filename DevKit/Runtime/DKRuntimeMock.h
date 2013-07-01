//
//  DKRuntimeMock.h
//  DevKit
//
//  Created by Andrew Koslow on 01.07.13.
//  Copyright (c) 2013 Andrew Koslow. All rights reserved.
//

#if (DK_RUNTIME_MOCK_ENABLE + 0)


#import <Foundation/Foundation.h>


void DKMockInstance(Class targetClass, Class mockClass);
void DKMockInstanceWithMethodNamePrefix(Class targetClass, Class mockClass, NSString *methodNamePrefix);


#endif
