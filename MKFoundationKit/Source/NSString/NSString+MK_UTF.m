//
//  NSString+MK_UTF.m
//  MKFoundation
//
//  Created by Michal Konturek on 22/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSString+MK_UTF.h"

@implementation NSString (MK_UTF)

+ (NSString *)mk_decodeUTF8String:(NSString *)value {
    return [value mk_decodeUTF8];
}

- (NSString *)mk_decodeUTF8 {
    // source: http://www.cafewebmaster.com/online_tools/utf_decode
    
    return [NSString stringWithCString:[self cStringUsingEncoding:NSISOLatin1StringEncoding]
                              encoding:NSUTF8StringEncoding];
}

@end
