//
//  NSString+MK.m
//  MKFoundation
//
//  Created by Michal Konturek on 11/07/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSString+MK.h"

@implementation NSString (MK)

+ (BOOL)isStringEmptyOrNil:(NSString *)value {
    if (value == nil) return YES;
    return [value isEmpty];
}

- (BOOL)isEmpty {
    return ([allTrim(self) length] == 0) ? YES : NO;
}

@end
