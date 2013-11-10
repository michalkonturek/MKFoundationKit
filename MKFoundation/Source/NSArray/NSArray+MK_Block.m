//
//  NSArray+MK_Block.m
//  MKFoundation
//
//  Created by Michal Konturek on 10/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSArray+MK_Block.h"

@implementation NSArray (MK_Block)

- (void)MK_apply:(LINQSelectorBlock)selectorBlock {
    METHOD_NOT_IMPLEMENTED
}

- (void)MK_each:(LINQSelectorBlock)selectorBlock {
    METHOD_NOT_IMPLEMENTED
}

- (id)MK_match:(LINQConditionBlock)conditionBlock {
    METHOD_NOT_IMPLEMENTED
}

- (instancetype)MK_map:(LINQSelectorBlock)selectorBlock {
    METHOD_NOT_IMPLEMENTED
}

- (instancetype)MK_reject:(LINQConditionBlock)conditionBlock {
    METHOD_NOT_IMPLEMENTED
}

- (instancetype)MK_select:(LINQConditionBlock)conditionBlock {
    METHOD_NOT_IMPLEMENTED
}

- (BOOL)MK_all:(LINQConditionBlock)conditionBlock {
    return [self LINQ_all:conditionBlock];
}

- (BOOL)MK_any:(LINQConditionBlock)conditionBlock {
    return [self LINQ_any:conditionBlock];
}

- (BOOL)MK_none:(LINQConditionBlock)conditionBlock {
    return (![self LINQ_all:conditionBlock]);
}

@end
