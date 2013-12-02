//
//  NSSet+MK_Block.h
//  MKFoundation
//
//  Created by Michal Konturek on 11/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSSet+MK.h"

@interface NSSet (MK_Block)

- (void)mk_apply:(MKItemBlock)block;

- (void)mk_each:(MKItemBlock)block;

- (instancetype)mk_map:(LINQSelectorBlock)selectorBlock;

- (id)mk_match:(LINQConditionBlock)conditionBlock;

- (id)mk_reduce:(id)initial withBlock:(LINQAccumulatorBlock)accumulatorBlock;

- (instancetype)mk_reject:(LINQConditionBlock)conditionBlock;

- (instancetype)mk_select:(LINQConditionBlock)conditionBlock;

- (BOOL)mk_all:(LINQConditionBlock)conditionBlock;

- (BOOL)mk_any:(LINQConditionBlock)conditionBlock;

- (BOOL)mk_none:(LINQConditionBlock)conditionBlock;

@end
