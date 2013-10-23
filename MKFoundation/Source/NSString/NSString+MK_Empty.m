//
//  NSString+MK_Empty.m
//  MKFoundation
//
//  Created by Michal Konturek on 23/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSString+MK_Empty.h"

@implementation NSString (MK_Empty)

+ (BOOL)isStringEmptyOrNil:(NSString *)value {
    if (value == nil) return YES;
    return [value isEmpty];
}

- (BOOL)isEmpty {
    return ([allTrim(self) length] == 0) ? YES : NO;
}

@end
