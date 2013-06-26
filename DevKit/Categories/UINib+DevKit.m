//
//  UINib+DevKit.m
//  DevKit
//
//  Created by Andrew Koslow on 16.12.12.
//  Copyright (c) 2012 Andrew Koslow. All rights reserved.
//

#if (DK_CATEGORIES_UI_NIB_ENABLE + 0)


#if !(DK_MACRO_ASSERT_ENABLE + 0)
#error UINib (DevKit) requires DK_MACRO_ASSERT_ENABLE = 1
#endif

#if !(DK_CATEGORIES_NS_ARRAY_ENABLE + 0)
#error UINib (DevKit) requires DK_CATEGORIES_NS_ARRAY_ENABLE = 1
#endif


#if (DK_MACRO_ASSERT_ENABLE + 0) && (DK_CATEGORIES_NS_ARRAY_ENABLE + 0)


#import "UINib+DevKit.h"
#import "DKAssert.h"
#import "NSArray+DevKit.h"


@implementation UINib (DevKit)


- (id)instantiatedWithOwner:(id)owner objectOfClass:(Class)objectClass {
	NSArray *instantiatedObjects = [self instantiateWithOwner:owner options:nil];
	DKAssertGreaterThanZero(instantiatedObjects.count);
	
	id instantiatedObject = instantiatedObjects.firstObject;
	DKAssertClass(instantiatedObject, objectClass);
	
	return instantiatedObject;
}


@end


#endif


#endif
