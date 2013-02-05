//
//  NSString+DevKit.m
//  DevKit
//
//  Created by Andrew Koslow on 08.01.13.
//  Copyright (c) 2013 Andrew Koslow. All rights reserved.
//

#import "NSString+DevKit.h"


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


@end
