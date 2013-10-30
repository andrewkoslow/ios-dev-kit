//
//  NSOrderedSet+DevKit.h
//  Acumatica
//
//  Created by Andrew Koslow on 30.10.13.
//  Copyright (c) 2013 Acumatica. All rights reserved.
//

#if (DK_CATEGORIES_NS_ORDERED_SET_ENABLE + 0)


#import <Foundation/Foundation.h>


@interface NSOrderedSet (DevKit)

- (NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level;

@end


#endif
