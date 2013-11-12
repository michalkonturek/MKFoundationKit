//
//  NSSet+MK_Block.m
//  MKFoundation
//
//  Created by Michal Konturek on 11/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSSet+MK_Block.h"

@implementation NSSet (MK_Block)

- (void)MK_apply:(MKItemBlock)block {
    [[self allObjects] MK_apply:block];
}

- (void)MK_each:(MKItemBlock)block {
    [[self allObjects] MK_each:block];
}

- (instancetype)MK_map:(LINQSelectorBlock)selectorBlock {
    id result = [[self allObjects] MK_map:selectorBlock];
    return [[self class] setWithArray:result];
}

- (id)MK_match:(LINQConditionBlock)conditionBlock {
    return [[self allObjects] MK_match:conditionBlock];
}

- (id)MK_reduce:(id)initial withBlock:(LINQAccumulatorBlock)accumulatorBlock {
    return [[self allObjects] MK_reduce:initial withBlock:accumulatorBlock];
}

- (instancetype)MK_reject:(LINQConditionBlock)conditionBlock {
    id result = [[self allObjects] MK_reject:conditionBlock];
    return [[self class] setWithArray:result];
}

- (instancetype)MK_select:(LINQConditionBlock)conditionBlock {
    id result = [[self allObjects] MK_select:conditionBlock];
    return [[self class] setWithArray:result];
}

- (BOOL)MK_all:(LINQConditionBlock)conditionBlock {
    return [[self allObjects] MK_all:conditionBlock];
}

- (BOOL)MK_any:(LINQConditionBlock)conditionBlock {
    return [[self allObjects] MK_any:conditionBlock];
}

- (BOOL)MK_none:(LINQConditionBlock)conditionBlock {
    return [[self allObjects] MK_none:conditionBlock];
}

@end
