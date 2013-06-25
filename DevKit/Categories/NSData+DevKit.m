//
//  NSData+DevKit.m
//  DevKit
//
//  Created by Andrew Koslow on 19.03.13.
//  Copyright (c) 2012 Andrew Koslow. All rights reserved.
//

#import "NSData+DevKit.h"


@implementation NSData (DevKit)


- (NSString *)hexadecimalString {
    const unsigned char *dataBuffer = (const unsigned char *)self.bytes;
    if (dataBuffer == NULL) return @"";
    
    NSMutableString *hexString  = [NSMutableString stringWithCapacity:(self.length * 2)];
    
    for (NSUInteger i = 0; i < self.length; ++i) {
        [hexString appendString:[NSString stringWithFormat:@"%02lx", (unsigned long)dataBuffer[i]]];
    }
    
    return [NSString stringWithString:hexString];
}


@end
