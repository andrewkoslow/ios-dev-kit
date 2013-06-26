//
//  NSArray+DevKit.m
//  DevKit
//
//  Created by Andrew Koslow on 16.12.12.
//  Copyright (c) 2012 Andrew Koslow. All rights reserved.
//

#if (DK_CATEGORIES_NS_ARRAY_ENABLE + 0)


#import "NSArray+DevKit.h"


@implementation NSArray (DevKit)


- (id)firstObject {
	id object = nil;
	if (self.count > 0) object = self[0];
	return object;
}


- (NSArray *)reversedArray {
    return self.reverseObjectEnumerator.allObjects;
}


- (NSArray *)arrayByPrependingObject:(id)anObject {
    return [[NSArray arrayWithObject:anObject] arrayByAddingObjectsFromArray:self];
}


- (NSArray *)arrayByRemovingObject:(id)anObject {
	NSMutableArray *array = [self mutableCopy];
	[array removeObject:anObject];
	return [array copy];
}


- (NSArray *)arrayByRemovingObjectsInArray:(NSArray *)objectsToRemove {
	NSMutableArray *array = [self mutableCopy];
	[array removeObjectsInArray:objectsToRemove];
	return [array copy];
}


- (NSArray *)arrayByIntersectingWithArray:(NSArray *)anotherArray {
	NSMutableSet *tempSet = [[NSMutableSet alloc] initWithArray:self];
	[tempSet intersectSet:[[NSSet alloc] initWithArray:anotherArray]];
	return tempSet.allObjects;
}


- (NSArray *)arrayOfObjectsOfClass:(Class)objectClass {
	NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:self.count];
	
	for (id object in self) {
		if ([object isKindOfClass:objectClass]) [array addObject:object];
	}
	
    return [array copy];
}


@end


#endif
