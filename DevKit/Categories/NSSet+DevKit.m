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


- (NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level {
    NSString *padding = [@"" stringByPaddingToLength:(level * 4) withString:@" " startingAtIndex:0];
    NSString *valuePadding = [@"" stringByPaddingToLength:((level + 1) * 4) withString:@" " startingAtIndex:0];
    
    NSString *output = (level ? @"" : padding);
    output = [output stringByAppendingString:@"{(\n"];
    
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
    
    output = [output stringByAppendingFormat:@"%@)}", padding];
    
    return output;
}


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
