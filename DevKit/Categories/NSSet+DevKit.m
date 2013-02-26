//
//  NSSet+DevKit.m
//  DevKit
//
//  Created by Andrew Koslow on 26.02.13.
//  Copyright (c) 2012 Andrew Koslow. All rights reserved.
//

#import "NSSet+DevKit.h"


@implementation NSSet (DevKit)


#pragma mark - ARC variant

#if __has_feature(objc_arc)

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


#pragma mark - Non-ARC variant

#else

- (NSSet *)setByRemovingObject:(id)anObject {
	NSMutableSet *set = [[self mutableCopy] autorelease];
	[set removeObject:anObject];
	return [NSSet setWithSet:set];
}


- (NSSet *)setByRemovingObjectsInSet:(NSSet *)objectsToRemove {
	NSMutableSet *set = [[self mutableCopy] autorelease];
	[set minusSet:objectsToRemove];
	return [NSSet setWithSet:set];
}


- (NSSet *)setByIntersectingWithSet:(NSSet *)anotherSet {
	NSMutableSet *set = [[self mutableCopy] autorelease];
	[set intersectSet:anotherSet];
	return [NSSet setWithSet:set];
}


- (NSSet *)setOfObjectsOfClass:(Class)objectClass {
	NSMutableSet *set = [[[NSMutableSet alloc] initWithCapacity:self.count] autorelease];
	
	for (id object in self) {
		if ([object isKindOfClass:objectClass]) [set addObject:object];
	}
	
	return [NSSet setWithSet:set];
}

#endif


@end
