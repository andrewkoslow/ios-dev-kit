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


- (NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level {
    NSString *padding = [@"" stringByPaddingToLength:(level * 4) withString:@" " startingAtIndex:0];
    NSString *valuePadding = [@"" stringByPaddingToLength:((level + 1) * 4) withString:@" " startingAtIndex:0];
    
    NSString *output = (level ? @"" : padding);
    output = [output stringByAppendingString:@"(\n"];
    
    NSInteger count = self.count;
    NSInteger index = 0;
    
    for (id object in self) {
        NSString *objectDescription = nil;
        if ([object respondsToSelector:@selector(descriptionWithLocale:indent:)]) objectDescription = [object descriptionWithLocale:locale indent:(level + 1)];
        else if ([object respondsToSelector:@selector(descriptionWithLocale:)]) objectDescription = [object descriptionWithLocale:locale];
        else objectDescription = [object description];
        
        output = [output stringByAppendingFormat:@"%@%@", valuePadding, objectDescription];
        output = [output stringByAppendingString:(((index + 1) < count) ? @",\n" : @"\n")];
        
        index++;
    }
    
    output = [output stringByAppendingFormat:@"%@)", padding];
    
    return output;
}


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


- (id)objectOfClass:(Class)objectClass atIndex:(NSUInteger)index {
    id object = self[index];
    if ([object isKindOfClass:objectClass] == NO) object = nil;
    return object;
}


- (NSDictionary *)dictionaryAtIndex:(NSUInteger)index {
    return [self objectOfClass:[NSDictionary class] atIndex:index];
}


- (NSArray *)arrayAtIndex:(NSUInteger)index {
    return [self objectOfClass:[NSArray class] atIndex:index];
}


- (NSString *)stringAtIndex:(NSUInteger)index {
    return [self objectOfClass:[NSString class] atIndex:index];
}


- (NSNumber *)numberAtIndex:(NSUInteger)index {
    return [self objectOfClass:[NSNumber class] atIndex:index];
}


- (BOOL)boolAtIndex:(NSUInteger)index {
    return [[self numberAtIndex:index] boolValue];
}


@end


#endif
