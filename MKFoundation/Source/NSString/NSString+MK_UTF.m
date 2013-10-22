//
//  NSString+MK_UTF.m
//  MKFoundation
//
//  Created by Michal Konturek on 22/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSString+MK_UTF.h"

@implementation NSString (MK_UTF)

+ (NSString *)decodeUTFString:(NSString *)value {
    return [value decodeUTF];
}

- (NSString *)decodeUTF {
    
    // source: http://stackoverflow.com/questions/4913499/utf8-character-decoding-in-objective-c
    return [NSString stringWithCString:[self cStringUsingEncoding:NSISOLatin1StringEncoding]
                              encoding:NSUTF8StringEncoding];
}

@end
