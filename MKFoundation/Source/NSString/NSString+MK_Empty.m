//
//  NSString+MK_Empty.m
//  MKFoundation
//
//  Created by Michal Konturek on 23/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSString+MK_Empty.h"

@implementation NSString (MK_Empty)

+ (BOOL)MK_isStringEmptyOrNil:(NSString *)value {
    if (value == nil) return YES;
    return [value MK_isEmpty];
}

- (BOOL)MK_containsString:(NSString *)term caseSensitive:(BOOL)caseSensitive {
    NSString *target = (caseSensitive) ? self : [self lowercaseString];
    NSString *searchTerm = (caseSensitive) ? term : [term lowercaseString];
    NSRange range = [target rangeOfString:searchTerm];
    return (range.location != NSNotFound);
}

- (BOOL)MK_isEmpty {
    return ([[self MK_trimmedString] length] == 0);
}

- (NSString *)MK_trimmedString {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}


- (NSString *)MK_firstComponent:(NSCharacterSet *)separators {
    return [self MK_componentAtIndex:0 usingSeparators:separators];
}

- (NSString *)MK_lastComponent:(NSCharacterSet *)separators {
    NSArray *components = [self componentsSeparatedByCharactersInSet:separators];
    return (components.count == 1) ? @"" : [components lastObject];
}

- (NSString *)MK_componentAtIndex:(NSInteger)index usingSeparators:(NSCharacterSet *)separators {
    NSArray *components = [self componentsSeparatedByCharactersInSet:separators];
    return (components.count == 1) ? @"" : [components objectAtIndex:index];
}


@end
