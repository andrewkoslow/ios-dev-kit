//
//  NSOrderedSet+DevKit.m
//  Acumatica
//
//  Created by Andrew Koslow on 30.10.13.
//  Copyright (c) 2013 Acumatica. All rights reserved.
//

#import "NSOrderedSet+DevKit.h"


@implementation NSOrderedSet (DevKit)


- (NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level {
    NSString *padding = [@"" stringByPaddingToLength:(level * 4) withString:@" " startingAtIndex:0];
    NSString *subpadding = [@"" stringByPaddingToLength:((level + 1) * 4) withString:@" " startingAtIndex:0];
    
    NSString *output = (level ? @"" : padding);
    output = [output stringByAppendingString:@"{(\n"];
    
    NSInteger count = self.count;
    NSInteger index = 0;
    
    for (id object in self) {
        NSString *objectDescription = nil;
        if ([object respondsToSelector:@selector(descriptionWithLocale:indent:)]) objectDescription = [object descriptionWithLocale:locale indent:(level + 1)];
        else if ([object respondsToSelector:@selector(descriptionWithLocale:)]) objectDescription = [object descriptionWithLocale:locale];
        else objectDescription = [object description];
        
        output = [output stringByAppendingFormat:@"%@%@", subpadding, objectDescription];
        output = [output stringByAppendingString:(((index + 1) < count) ? @",\n" : @"\n")];
        
        index++;
    }
    
    output = [output stringByAppendingFormat:@"%@)}", padding];
    
    return output;
}


@end
