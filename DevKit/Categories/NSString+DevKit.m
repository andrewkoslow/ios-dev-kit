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
    
    if (encodedString) escapedString = [(NSString *)encodedString autorelease];
    if (escapedString.length == 0) escapedString = @"";
    
    return escapedString;
}


@end
