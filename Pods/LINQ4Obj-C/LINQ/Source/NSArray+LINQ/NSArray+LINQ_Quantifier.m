//
//  NSArray+LINQ_Quantifier.m
//  LINQ4Obj-C
//
//  Created by Michal Konturek on 23/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSArray+LINQ_Quantifier.h"

@implementation NSArray (LINQ_Quantifier)

- (BOOL)linq_all:(LINQConditionBlock)conditionBlock {
    if (!conditionBlock) return YES;
    for (id item in self) {
        if (!conditionBlock(item)) return NO;
    }
    return YES;
}

- (BOOL)linq_any:(LINQConditionBlock)conditionBlock {
    if (!conditionBlock) return NO;
    for (id item in self) {
        if (conditionBlock(item)) return YES;
    }
    return NO;
}

@end