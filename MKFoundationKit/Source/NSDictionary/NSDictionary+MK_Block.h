//
//  NSDictionary+MK_Block.h
//  MKFoundation
//
//  Created by Michal Konturek on 11/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSDictionary+MK.h"

@interface NSDictionary (MK_Block)

- (void)mk_apply:(MKItemBlock)block;

- (void)mk_each:(MKItemBlock)block;

- (instancetype)mk_map:(LINQSelectorBlock)selectorBlock;

- (id)mk_match:(LINQKeyValueConditionBlock)conditionBlock;

- (id)mk_reduce:(id)initial withBlock:(LINQAccumulatorBlock)accumulatorBlock;

- (instancetype)mk_reject:(LINQKeyValueConditionBlock)conditionBlock;

- (instancetype)mk_select:(LINQKeyValueConditionBlock)conditionBlock;

- (BOOL)mk_all:(LINQKeyValueConditionBlock)conditionBlock;

- (BOOL)mk_any:(LINQKeyValueConditionBlock)conditionBlock;

- (BOOL)mk_none:(LINQKeyValueConditionBlock)conditionBlock;

@end
