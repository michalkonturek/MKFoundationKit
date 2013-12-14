//
//  NSArray+MK_Block.m
//  MKFoundation
//
//  Created by Michal Konturek on 10/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSArray+MK_Block.h"

@implementation NSArray (MK_Block)

- (void)mk_apply:(void (^)(id item))block {
    if (!block) return;
    
    [self enumerateObjectsWithOptions:NSEnumerationConcurrent
                           usingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        block(obj);
    }];
}

- (void)mk_each:(void (^)(id item))block {
    if (!block) return;
    
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        block(obj);
    }];
}

- (instancetype)mk_map:(id (^)(id item))selectorBlock {
    if (!selectorBlock) return [[self class] array];
    
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:self.count];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        id value = selectorBlock(obj) ? : [NSNull null];
        [result addObject:value];
    }];
    return result;
}

- (id)mk_match:(BOOL (^)(id item))conditionBlock {
    if (!conditionBlock) return self;
    
    __block id result = nil;
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if (conditionBlock(obj)) {
            result = obj;
            *stop = YES;
        }
    }];
    
    return result;
}

- (id)mk_reduce:(id (^)(id item, id aggregate))accumulatorBlock {
    return [self mk_reduce:nil withBlock:accumulatorBlock];
}

- (id)mk_reduce:(id)initial withBlock:(id (^)(id item, id aggregate))accumulatorBlock {
    if (!accumulatorBlock) return self;
    
    __block id result = initial;
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if (!result) result = obj;
        else result = accumulatorBlock(obj, result);
    }];
    
    return result;
}

- (instancetype)mk_reject:(BOOL (^)(id item))conditionBlock {
    return [self mk_select:^BOOL(id item) {
        return (!conditionBlock(item));
    }];
}

- (instancetype)mk_select:(BOOL (^)(id item))conditionBlock {
    if (!conditionBlock) return self;
    
    NSMutableArray *result = [NSMutableArray array];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if (conditionBlock(obj)) [result addObject:obj];
    }];
    return result;
}

- (BOOL)mk_all:(BOOL (^)(id item))conditionBlock {
    if (!conditionBlock) return YES;
    for (id item in self) {
        if (!conditionBlock(item)) return NO;
    }
    return YES;
}

- (BOOL)mk_any:(BOOL (^)(id item))conditionBlock {
    if (!conditionBlock) return NO;
    for (id item in self) {
        if (conditionBlock(item)) return YES;
    }
    return NO;
}

- (BOOL)mk_none:(BOOL (^)(id item))conditionBlock {
    return ![self mk_any:conditionBlock];
}

@end
