//
//  NSDictionary+DevKit.m
//  DevKit
//
//  Created by Andrew Koslow on 16.12.12.
//  Copyright (c) 2012 Andrew Koslow. All rights reserved.
//

#if (DK_CATEGORIES_NS_DICTIONARY_ENABLE + 0)


#if !(DK_CATEGORIES_NS_ARRAY_ENABLE + 0)
#error NSDictionary (DevKit) requires DK_CATEGORIES_NS_ARRAY_ENABLE = 1
#endif


#if (DK_CATEGORIES_NS_ARRAY_ENABLE + 0)


#import "NSDictionary+DevKit.h"
#import "NSArray+DevKit.h"


@implementation NSDictionary (DevKit)


- (instancetype)dictionaryBySettingObject:(id)object forKey:(id)key {
	NSMutableDictionary *dictionary = [self mutableCopy];
    [dictionary setValue:object forKey:key];
	return [dictionary copy];
}


- (id)objectOfClass:(Class)objectClass forKey:(id)key {
    id object = self[key];
    if ([object isKindOfClass:objectClass] == NO) object = nil;
    return object;
}


- (NSDictionary *)dictionaryForKey:(id)key {
    return [self objectOfClass:[NSDictionary class] forKey:key];
}


- (NSArray *)arrayForKey:(id)key {
    return [self objectOfClass:[NSArray class] forKey:key];
}


- (NSArray *)arrayOfObjectsOfClass:(Class)objectClass forKey:(id)key {
	return [[self arrayForKey:key] arrayOfObjectsOfClass:objectClass];
}


- (NSString *)stringForKey:(id)key {
    return [self objectOfClass:[NSString class] forKey:key];
}


- (NSNumber *)numberForKey:(id)key {
    return [self objectOfClass:[NSNumber class] forKey:key];
}


- (BOOL)boolForKey:(id)key {
    return [[self numberForKey:key] boolValue];
}


@end


#endif


#endif
