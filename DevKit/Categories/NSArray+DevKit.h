//
//  NSArray+DevKit.h
//  DevKit
//
//  Created by Andrew Koslow on 16.12.12.
//  Copyright (c) 2012 Andrew Koslow. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSArray (DevKit)

- (id)firstObject;
- (NSArray *)arrayByRemovingObject:(id)anObject;
- (NSArray *)arrayByRemovingObjectsInArray:(NSArray *)objectsToRemove;
- (NSArray *)arrayByIntersectingWithArray:(NSArray *)anotherArray;
- (NSArray *)arrayOfObjectsOfClass:(Class)objectClass;

@end
