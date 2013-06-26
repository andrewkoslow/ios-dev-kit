//
//  NSSet+DevKit.m
//  DevKit
//
//  Created by Andrew Koslow on 26.02.13.
//  Copyright (c) 2012 Andrew Koslow. All rights reserved.
//

#if (DK_CATEGORIES_NS_SET_ENABLE + 0)


#import "NSSet+DevKit.h"


@implementation NSSet (DevKit)


- (instancetype)setByRemovingObject:(id)anObject {
	NSMutableSet *set = [self mutableCopy];
	[set removeObject:anObject];
	return [set copy];
}


- (instancetype)setByRemovingObjectsInSet:(NSSet *)objectsToRemove {
	NSMutableSet *set = [self mutableCopy];
	[set minusSet:objectsToRemove];
	return [set copy];
}


- (instancetype)setByIntersectingWithSet:(NSSet *)anotherSet {
	NSMutableSet *set = [self mutableCopy];
	[set intersectSet:anotherSet];
	return [set copy];
}


- (instancetype)setOfObjectsOfClass:(Class)objectClass {
	NSMutableSet *set = [[[self class] new] mutableCopy];
	
	for (id object in self) {
		if ([object isKindOfClass:objectClass]) [set addObject:object];
	}
	
    return [set copy];
}


@end


#endif
