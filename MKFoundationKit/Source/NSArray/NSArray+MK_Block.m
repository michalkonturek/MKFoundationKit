//
//  NSArray+MK_Block.m
//  MKFoundation
//
//  Created by Michal Konturek on 10/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSArray+MK_Block.h"

@implementation NSArray (MK_Block)

- (void)mk_apply:(MKItemBlock)block {
    if (!block) return;
    
    [self enumerateObjectsWithOptions:NSEnumerationConcurrent
                           usingBlock:^(id obj, NSUInteger idx, BOOL *stop)
    {
        block(obj);
    }];
}

- (void)mk_each:(MKItemBlock)block {
    if (!block) return;
    
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        block(obj);
    }];
}

- (instancetype)mk_map:(LINQSelectorBlock)selectorBlock {
    return [self LINQ_select:selectorBlock];
}

- (id)mk_match:(LINQConditionBlock)conditionBlock {
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

- (id)mk_reduce:(id)initial withBlock:(LINQAccumulatorBlock)accumulatorBlock {
    if (!accumulatorBlock) return self;
    
    __block id result = initial;
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        result = accumulatorBlock(obj, result);
    }];
    
    return result;
}

- (instancetype)mk_reject:(LINQConditionBlock)conditionBlock {
    return [self LINQ_where:^BOOL(id item) {
        return (!conditionBlock(item));
    }];
}

- (instancetype)mk_select:(LINQConditionBlock)conditionBlock {
    return [self LINQ_where:conditionBlock];
}

- (BOOL)mk_all:(LINQConditionBlock)conditionBlock {
    return [self LINQ_all:conditionBlock];
}

- (BOOL)mk_any:(LINQConditionBlock)conditionBlock {
    return [self LINQ_any:conditionBlock];
}

- (BOOL)mk_none:(LINQConditionBlock)conditionBlock {
    return ![self LINQ_any:conditionBlock];
}

@end
