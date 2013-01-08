//
//  NSURL+DevKit.h
//  DevKit
//
//  Created by Andrew Koslow on 08.01.13.
//  Copyright (c) 2013 Andrew Koslow. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSURL (DevKit)

- (NSURL *)URLByAppendingQueryParameters:(NSDictionary *)parameters;

@end
