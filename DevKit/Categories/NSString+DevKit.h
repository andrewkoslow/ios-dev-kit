//
//  NSString+DevKit.h
//  DevKit
//
//  Created by Andrew Koslow on 08.01.13.
//  Copyright (c) 2013 Andrew Koslow. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSString (DevKit)

- (NSString *)stringByAddingPercentEscapes;
- (NSString *)stringByReplacingPercentEscapes;
- (NSString *)shuffle;
- (NSString *)sha1;
- (NSString *)sha256;

@end
