//
//  NSString+MK_Empty.m
//  MKFoundation
//
//  Created by Michal Konturek on 23/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSString+MK_Empty.h"

@implementation NSString (MK_Empty)

+ (BOOL)mk_isStringEmptyOrNil:(NSString *)value {
    if (value == nil) return YES;
    return [value mk_isEmpty];
}

- (BOOL)mk_isEmpty {
    return ([[self mk_trimmedString] length] == 0);
}

- (NSString *)mk_trimmedString {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

@end
