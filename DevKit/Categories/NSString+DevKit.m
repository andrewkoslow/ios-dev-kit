//
//  NSString+DevKit.m
//  DevKit
//
//  Created by Andrew Koslow on 08.01.13.
//  Copyright (c) 2013 Andrew Koslow. All rights reserved.
//

#import "NSString+DevKit.h"
#import "NSData+DevKit.h"
#import <CommonCrypto/CommonHMAC.h>
#include <stdlib.h>


@implementation NSString (DevKit)


- (NSString *)stringByAddingPercentEscapes {
    NSString *escapedString = nil;
    
    CFStringRef legalURLCharactersToBeEscaped = CFSTR(":/?#[]@!$ &'()*+,;=\"<>%{}|\\^~`\n\r");
    CFStringRef encodedString = CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)self, NULL, legalURLCharactersToBeEscaped, kCFStringEncodingUTF8);
    
#if __has_feature(objc_arc)
    if (encodedString) {
        escapedString = (__bridge NSString *)(encodedString);
        CFBridgingRelease(encodedString);
    }
#else
    if (encodedString) escapedString = [(NSString *)encodedString autorelease];
#endif
    
    if (escapedString.length == 0) escapedString = @"";
    
    return escapedString;
}


- (NSString *)stringByReplacingPercentEscapes {
    return [self stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}


- (NSString *)shuffle {
    NSMutableString *tempString = [self mutableCopy];
    
    for (NSInteger i = tempString.length - 1; i >= 0; i--) {
        NSInteger j = arc4random() % (i + 1);
        
        NSString *buffer = [tempString substringWithRange:NSMakeRange(i, 1)];
        [tempString replaceCharactersInRange:NSMakeRange(i, 1) withString:[tempString substringWithRange:NSMakeRange(j, 1)]];
        [tempString replaceCharactersInRange:NSMakeRange(j, 1) withString:buffer];
    }
    
    NSString *shuffledString = [NSString stringWithString:tempString];
    [tempString release];
    
    return shuffledString;
}


- (NSString *)sha1 {
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    uint8_t digest[CC_SHA1_DIGEST_LENGTH] = {0};
    
    CC_SHA1(data.bytes, data.length, digest);
    
    return [data hexadecimalString];
}


- (NSString *)sha256 {
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    uint8_t digest[CC_SHA256_DIGEST_LENGTH] = {0};
    
    CC_SHA256(data.bytes, data.length, digest);
    
    return [data hexadecimalString];
}


@end
