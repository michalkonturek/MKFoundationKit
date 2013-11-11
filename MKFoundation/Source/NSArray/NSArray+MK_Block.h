//
//  NSArray+MK_Block.h
//  MKFoundation
//
//  Created by Michal Konturek on 10/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSArray+MK.h"

@interface NSArray (MK_Block)

- (void)MK_apply:(MKItemBlock)block;

- (void)MK_each:(MKItemBlock)block;

- (instancetype)MK_map:(LINQSelectorBlock)selectorBlock;

- (id)MK_match:(LINQConditionBlock)conditionBlock;

- (id)MK_reduce:(id)initial withBlock:(LINQAccumulatorBlock)accumulatorBlock;

- (instancetype)MK_reject:(LINQConditionBlock)conditionBlock;

- (instancetype)MK_select:(LINQConditionBlock)conditionBlock;

- (BOOL)MK_all:(LINQConditionBlock)conditionBlock;

- (BOOL)MK_any:(LINQConditionBlock)conditionBlock;

- (BOOL)MK_none:(LINQConditionBlock)conditionBlock;

@end
