//
//  UINib+DevKit.m
//  DevKit
//
//  Created by Andrew Koslow on 16.12.12.
//  Copyright (c) 2012 Andrew Koslow. All rights reserved.
//

#import "UINib+DevKit.h"
#import "AWAssert.h"
#import "NSArray+DevKit.h"


@implementation UINib (DevKit)


- (id)instantiatedWithOwner:(id)owner objectOfClass:(Class)objectClass {
	NSArray *instantiatedObjects = [self instantiateWithOwner:owner options:nil];
	AWAssertGreaterThanZero(instantiatedObjects.count);
	
	id instantiatedObject = instantiatedObjects.firstObject;
	AWAssertClass(instantiatedObject, objectClass);
	
	return instantiatedObject;
}


@end
