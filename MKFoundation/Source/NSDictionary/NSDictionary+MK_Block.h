//
//  NSDictionary+MK_Block.h
//  MKFoundation
//
//  Created by Michal Konturek on 11/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSDictionary+MK.h"

@interface NSDictionary (MK_Block)

- (void)MK_apply:(MKItemBlock)block;

- (void)MK_each:(MKItemBlock)block;

- (instancetype)MK_map:(LINQSelectorBlock)selectorBlock;

- (id)MK_match:(LINQKeyValueConditionBlock)conditionBlock;

- (id)MK_reduce:(id)initial withBlock:(LINQAccumulatorBlock)accumulatorBlock;

- (instancetype)MK_reject:(LINQKeyValueConditionBlock)conditionBlock;

- (instancetype)MK_select:(LINQKeyValueConditionBlock)conditionBlock;

- (BOOL)MK_all:(LINQKeyValueConditionBlock)conditionBlock;

- (BOOL)MK_any:(LINQKeyValueConditionBlock)conditionBlock;

- (BOOL)MK_none:(LINQKeyValueConditionBlock)conditionBlock;

@end
