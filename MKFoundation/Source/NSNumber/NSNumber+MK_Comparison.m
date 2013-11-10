//
//  NSNumber+MK_Comparison.m
//  MKFoundationKit
//
//  Created by Michal Konturek on 06/07/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSNumber+MK_Comparison.h"

#import "LINQ.h"

@implementation NSNumber (MK_Comparison)

+ (instancetype)MK_max:(NSArray *)numbers {
    return [numbers LINQ_max];
}

+ (instancetype)MK_min:(NSArray *)numbers {
    return [numbers LINQ_min];
}

- (instancetype)MK_max:(NSArray *)others {
    return [[[NSMutableArray arrayWithArray:others] arrayByAddingObject:self] LINQ_max];
}

- (instancetype)MK_min:(NSArray *)others {
    return [[[NSMutableArray arrayWithArray:others] arrayByAddingObject:self] LINQ_min];
}

- (BOOL)MK_isTheSame:(NSNumber *)other {
    return ([self compare:other] == NSOrderedSame);
}

- (BOOL)MK_isGreaterThan:(NSNumber *)other {
    return ([self compare:other] == NSOrderedDescending);
}

- (BOOL)MK_isLessThan:(NSNumber *)other {
    return ([self compare:other] == NSOrderedAscending);
}

- (BOOL)MK_isEven {
    return (![self MK_isOdd]);
}

- (BOOL)MK_isOdd {
    if ([self MK_isFraction]) return YES;
    if ([self MK_isTheSame:@0]) return NO;
    return [[self MK_divideBy:@2] MK_isFraction];
}

@end
