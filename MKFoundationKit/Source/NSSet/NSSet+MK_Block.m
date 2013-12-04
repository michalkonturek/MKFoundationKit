//
//  NSSet+MK_Block.m
//  MKFoundation
//
//  Created by Michal Konturek on 11/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSSet+MK_Block.h"

@implementation NSSet (MK_Block)

- (void)mk_apply:(void (^)(id item))block {
    [[self allObjects] mk_apply:block];
}

- (void)mk_each:(void (^)(id item))block {
    [[self allObjects] mk_each:block];
}

- (instancetype)mk_map:(LINQSelectorBlock)selectorBlock {
    id result = [[self allObjects] mk_map:selectorBlock];
    return [[self class] setWithArray:result];
}

- (id)mk_match:(LINQConditionBlock)conditionBlock {
    return [[self allObjects] mk_match:conditionBlock];
}

- (id)mk_reduce:(id)initial withBlock:(LINQAccumulatorBlock)accumulatorBlock {
    return [[self allObjects] mk_reduce:initial withBlock:accumulatorBlock];
}

- (instancetype)mk_reject:(LINQConditionBlock)conditionBlock {
    id result = [[self allObjects] mk_reject:conditionBlock];
    return [[self class] setWithArray:result];
}

- (instancetype)mk_select:(LINQConditionBlock)conditionBlock {
    id result = [[self allObjects] mk_select:conditionBlock];
    return [[self class] setWithArray:result];
}

- (BOOL)mk_all:(LINQConditionBlock)conditionBlock {
    return [[self allObjects] mk_all:conditionBlock];
}

- (BOOL)mk_any:(LINQConditionBlock)conditionBlock {
    return [[self allObjects] mk_any:conditionBlock];
}

- (BOOL)mk_none:(LINQConditionBlock)conditionBlock {
    return [[self allObjects] mk_none:conditionBlock];
}

@end
