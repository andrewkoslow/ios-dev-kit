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


- (instancetype)reversedArray {
    return [[self class] arrayWithArray:self.reverseObjectEnumerator.allObjects];
}


- (instancetype)arrayByPrependingObject:(id)anObject {
    return [[[self class] arrayWithObject:anObject] arrayByAddingObjectsFromArray:self];
}


- (instancetype)arrayByRemovingObject:(id)anObject {
	NSMutableArray *array = [self mutableCopy];
	[array removeObject:anObject];
	return [array copy];
}


- (instancetype)arrayByRemovingObjectsInArray:(NSArray *)objectsToRemove {
	NSMutableArray *array = [self mutableCopy];
	[array removeObjectsInArray:objectsToRemove];
	return [array copy];
}


- (instancetype)arrayByIntersectingWithArray:(NSArray *)anotherArray {
	NSMutableSet *tempSet = [[NSMutableSet alloc] initWithArray:self];
	[tempSet intersectSet:[[NSSet alloc] initWithArray:anotherArray]];
	return [[self class] arrayWithArray:tempSet.allObjects];
}


- (instancetype)arrayOfObjectsOfClass:(Class)objectClass {
	NSMutableArray *array = [[[self class] new] mutableCopy];
	
	for (id object in self) {
		if ([object isKindOfClass:objectClass]) [array addObject:object];
	}
	
    return [array copy];
}


@end


#endif
