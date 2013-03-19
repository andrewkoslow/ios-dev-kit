//
//  NSSet+DevKit.h
//  DevKit
//
//  Created by Andrew Koslow on 26.02.13.
//  Copyright (c) 2012 Andrew Koslow. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSSet (DevKit)

- (NSSet *)setByRemovingObject:(id)anObject;
- (NSSet *)setByRemovingObjectsInSet:(NSSet *)objectsToRemove;
- (NSSet *)setByIntersectingWithSet:(NSSet *)anotherSet;
- (NSSet *)setOfObjectsOfClass:(Class)objectClass;

@end