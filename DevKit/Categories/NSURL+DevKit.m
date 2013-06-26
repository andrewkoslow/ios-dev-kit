//
//  NSURL+DevKit.m
//  DevKit
//
//  Created by Andrew Koslow on 08.01.13.
//  Copyright (c) 2013 Andrew Koslow. All rights reserved.
//

#if (DK_CATEGORIES_NS_URL_ENABLE + 0)


#if !(DK_CATEGORIES_NS_STRING_ENABLE + 0)
#error NSURL (DevKit) requires DK_CATEGORIES_NS_STRING_ENABLE = 1
#endif


#if (DK_CATEGORIES_NS_STRING_ENABLE + 0)


#import "NSURL+DevKit.h"
#import "NSString+DevKit.h"


@implementation NSURL (DevKit)


- (NSURL *)URLByAppendingQueryParameters:(NSDictionary *)parameters {
    if (parameters.count == 0) return self;
    
    NSMutableArray *parameterStringParts = [NSMutableArray new];
    
    for (NSString *key in parameters) {
        NSString *value = parameters[key];
        
        if ([key isKindOfClass:[NSString class]] == NO || [value isKindOfClass:[NSString class]] == NO) continue;
        
        NSString *parameterStringPart = [NSString stringWithFormat:@"%@=%@", [key stringByAddingPercentEscapes], [value stringByAddingPercentEscapes]];
        [parameterStringParts addObject:parameterStringPart];
    }
    
    NSString *parameterString = [parameterStringParts componentsJoinedByString:@"&"];
    NSString *URLString = [NSString stringWithFormat:@"%@%@%@", self.absoluteString, ((self.query.length > 0) ? @"&" : @"?"), parameterString];
    
    return [NSURL URLWithString:URLString];
}


@end


#endif


#endif
