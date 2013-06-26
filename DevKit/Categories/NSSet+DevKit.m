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


- (NSSet *)setByRemovingObject:(id)anObject {
	NSMutableSet *set = [self mutableCopy];
	[set removeObject:anObject];
	return [set copy];
}


- (NSSet *)setByRemovingObjectsInSet:(NSSet *)objectsToRemove {
	NSMutableSet *set = [self mutableCopy];
	[set minusSet:objectsToRemove];
	return [set copy];
}


- (NSSet *)setByIntersectingWithSet:(NSSet *)anotherSet {
	NSMutableSet *set = [self mutableCopy];
	[set intersectSet:anotherSet];
	return [set copy];
}


- (NSSet *)setOfObjectsOfClass:(Class)objectClass {
	NSMutableSet *set = [[NSMutableSet alloc] initWithCapacity:self.count];
	
	for (id object in self) {
		if ([object isKindOfClass:objectClass]) [set addObject:object];
	}
	
    return [set copy];
}


@end


#endif
