//
//  NSDictionary+MK_Block.m
//  MKFoundation
//
//  Created by Michal Konturek on 11/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSDictionary+MK_Block.h"

@implementation NSDictionary (MK_Block)

- (void)MK_apply:(MKItemBlock)block {
    METHOD_NOT_IMPLEMENTED
}

- (void)MK_each:(MKItemBlock)block {
    METHOD_NOT_IMPLEMENTED
}

- (instancetype)MK_map:(LINQSelectorBlock)selectorBlock {
    METHOD_NOT_IMPLEMENTED
}

- (id)MK_match:(LINQConditionBlock)conditionBlock {
    METHOD_NOT_IMPLEMENTED
}

- (id)MK_reduce:(id)initial withBlock:(LINQAccumulatorBlock)accumulatorBlock {
    METHOD_NOT_IMPLEMENTED
}

- (instancetype)MK_reject:(LINQConditionBlock)conditionBlock {
    METHOD_NOT_IMPLEMENTED
}

- (instancetype)MK_select:(LINQConditionBlock)conditionBlock {
    METHOD_NOT_IMPLEMENTED
}

- (BOOL)MK_all:(LINQConditionBlock)conditionBlock {
    METHOD_NOT_IMPLEMENTED
}

- (BOOL)MK_any:(LINQConditionBlock)conditionBlock {
    METHOD_NOT_IMPLEMENTED
}

- (BOOL)MK_none:(LINQConditionBlock)conditionBlock {
    METHOD_NOT_IMPLEMENTED
}

@end
