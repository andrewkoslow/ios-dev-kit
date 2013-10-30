//
//  NSSet+DevKit.h
//  DevKit
//
//  Created by Andrew Koslow on 26.02.13.
//  Copyright (c) 2012 Andrew Koslow. All rights reserved.
//

#if (DK_CATEGORIES_NS_SET_ENABLE + 0)


#import <Foundation/Foundation.h>


@interface NSSet (DevKit)

- (NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level;
- (instancetype)setByRemovingObject:(id)anObject;
- (instancetype)setByRemovingObjectsInSet:(NSSet *)objectsToRemove;
- (instancetype)setByIntersectingWithSet:(NSSet *)anotherSet;
- (instancetype)setOfObjectsOfClass:(Class)objectClass;

@end


#endif
