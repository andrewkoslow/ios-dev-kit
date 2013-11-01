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

- (NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level;
- (id)firstObject;
- (instancetype)reversedArray;
- (instancetype)arrayByRemovingObject:(id)anObject;
- (instancetype)arrayByRemovingObjectsInArray:(NSArray *)objectsToRemove;
- (instancetype)arrayByIntersectingWithArray:(NSArray *)anotherArray;
- (instancetype)arrayOfObjectsOfClass:(Class)objectClass;
- (instancetype)arrayByPrependingObject:(id)anObject;
- (id)objectOfClass:(Class)objectClass atIndex:(NSUInteger)index;
- (NSDictionary *)dictionaryAtIndex:(NSUInteger)index;
- (NSArray *)arrayAtIndex:(NSUInteger)index;
- (NSString *)stringAtIndex:(NSUInteger)index;
- (NSNumber *)numberAtIndex:(NSUInteger)index;
- (BOOL)boolAtIndex:(NSUInteger)index;

@end


#endif
