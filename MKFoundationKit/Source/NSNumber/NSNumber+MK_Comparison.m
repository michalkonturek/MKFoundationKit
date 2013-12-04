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

+ (instancetype)mk_max:(NSArray *)numbers {
    return [numbers linq_max];
}

+ (instancetype)mk_min:(NSArray *)numbers {
    return [numbers linq_min];
}

- (instancetype)mk_max:(NSArray *)others {
    return [[[NSMutableArray arrayWithArray:others] arrayByAddingObject:self] linq_max];
}

- (instancetype)mk_min:(NSArray *)others {
    return [[[NSMutableArray arrayWithArray:others] arrayByAddingObject:self] linq_min];
}

- (BOOL)mk_isTheSame:(NSNumber *)other {
    return ([self compare:other] == NSOrderedSame);
}

- (BOOL)mk_isGreaterThan:(NSNumber *)other {
    return ([self compare:other] == NSOrderedDescending);
}

- (BOOL)mk_isLessThan:(NSNumber *)other {
    return ([self compare:other] == NSOrderedAscending);
}

- (BOOL)mk_isEven {
    return (![self mk_isOdd]);
}

- (BOOL)mk_isOdd {
    if ([self mk_isFraction]) return YES;
    if ([self mk_isTheSame:@0]) return NO;
    return [[self mk_divideBy:@2] mk_isFraction];
}

@end
