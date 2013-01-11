//
//  UINib+DevKit.m
//  DevKit
//
//  Created by Andrew Koslow on 16.12.12.
//  Copyright (c) 2012 Andrew Koslow. All rights reserved.
//

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
