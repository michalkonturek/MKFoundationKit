//
//  NSArray+LINQ_Projection.m
//  LINQ4Obj-C
//
//  Created by Michal Konturek on 22/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSArray+LINQ_Projection.h"

@implementation NSArray (LINQ_Projection)

- (instancetype)linq_select:(LINQSelectorBlock)selectorBlock {
    if (!selectorBlock) return [[self class] array];
    
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:self.count];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [result addObject:selectorBlock(obj)];
    }];
    return result;
}

- (instancetype)linq_selectMany:(LINQSelectorBlock)selectorBlock {
    if (!selectorBlock) return [[self class] array];
    
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:self.count];
    [self enumerateObjectsUsingBlock:^(id parent, NSUInteger idx, BOOL *stop) {
        [selectorBlock(parent) enumerateObjectsUsingBlock:^(id child, NSUInteger idx, BOOL *stop) {
            [result addObject:child];
        }];
    }];
    
    return result;
}

@end