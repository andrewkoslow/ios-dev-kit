//
//  NSArray+DevKit.h
//  DevKit
//
//  Created by Andrew Koslow on 16.12.12.
//  Copyright (c) 2012 Andrew Koslow. All rights reserved.
//

#if (DK_CATEGORIES_NS_ARRAY_ENABLE + 0)


#import <Foundation/Foundation.h>


@interface NSArray (DevKit)

- (id)firstObject;
- (NSArray *)reversedArray;
- (NSArray *)arrayByRemovingObject:(id)anObject;
- (NSArray *)arrayByRemovingObjectsInArray:(NSArray *)objectsToRemove;
- (NSArray *)arrayByIntersectingWithArray:(NSArray *)anotherArray;
- (NSArray *)arrayOfObjectsOfClass:(Class)objectClass;
- (NSArray *)arrayByPrependingObject:(id)anObject;

@end


#endif
