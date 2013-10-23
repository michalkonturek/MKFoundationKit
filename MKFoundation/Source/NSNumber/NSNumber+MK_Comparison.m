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

+ (instancetype)max:(NSArray *)numbers {
    return [numbers LINQ_max];
}

+ (instancetype)min:(NSArray *)numbers {
    return [numbers LINQ_min];
}

- (instancetype)max:(NSArray *)others {
    return [[[NSMutableArray arrayWithArray:others] arrayByAddingObject:self] LINQ_max];
}

- (instancetype)min:(NSArray *)others {
    return [[[NSMutableArray arrayWithArray:others] arrayByAddingObject:self] LINQ_min];
}

- (BOOL)isTheSame:(NSNumber *)other {
    return ([self compare:other] == NSOrderedSame);
}

- (BOOL)isGreaterThan:(NSNumber *)other {
    return ([self compare:other] == NSOrderedDescending);
}

- (BOOL)isLessThan:(NSNumber *)other {
    return ([self compare:other] == NSOrderedAscending);
}

@end
