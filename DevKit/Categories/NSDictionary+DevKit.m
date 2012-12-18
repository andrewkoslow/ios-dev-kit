//
//  NSDictionary+DevKit.m
//  DevKit
//
//  Created by Andrew Koslow on 16.12.12.
//  Copyright (c) 2012 Andrew Koslow. All rights reserved.
//

#import "NSDictionary+DevKit.h"
#import "NSArray+DevKit.h"


@implementation NSDictionary (DevKit)


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


#pragma mark - ARC variant

#if __has_feature(objc_arc)

- (id)dictionaryBySettingObject:(id)object forKey:(id)key {
	NSMutableDictionary *dictionary = [self mutableCopy];
    dictionary[key] = object;
	return [dictionary copy];
}


#pragma mark - Non-ARC variant

#else

- (id)dictionaryBySettingObject:(id)object forKey:(id)key {
	NSMutableDictionary *dictionary = [[self mutableCopy] autorelease];
    dictionary[key] = object;
	return [NSDictionary dictionaryWithDictionary:dictionary];
}

#endif


@end