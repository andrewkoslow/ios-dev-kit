//
//  NSDictionary+DevKit.h
//  DevKit
//
//  Created by Andrew Koslow on 16.12.12.
//  Copyright (c) 2012 Andrew Koslow. All rights reserved.
//

#if (DK_CATEGORIES_NS_DICTIONARY_ENABLE + 0)


#import <Foundation/Foundation.h>


@interface NSDictionary (DevKit)

- (instancetype)dictionaryBySettingObject:(id)object forKey:(id)key;
- (id)objectOfClass:(Class)objectClass forKey:(id)key;
- (NSArray *)arrayOfObjectsOfClass:(Class)objectClass forKey:(id)key;
- (NSDictionary *)dictionaryForKey:(id)key;
- (NSArray *)arrayForKey:(id)key;
- (NSString *)stringForKey:(id)key;
- (NSNumber *)numberForKey:(id)key;
- (BOOL)boolForKey:(id)key;

@end


#endif
