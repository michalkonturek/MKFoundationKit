//
//  NSArray+MK_Block.h
//  MKFoundation
//
//  Created by Michal Konturek on 10/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (MK_Block)

- (void)mk_apply:(void (^)(id item))block;

- (void)mk_each:(void (^)(id item))block;

- (instancetype)mk_map:(id (^)(id item))selectorBlock;

- (id)mk_match:(BOOL (^)(id item))conditionBlock;

- (id)mk_reduce:(id (^)(id item, id aggregate))accumulatorBlock;

- (id)mk_reduce:(id)initial withBlock:(id (^)(id item, id aggregate))accumulatorBlock;

- (instancetype)mk_reject:(BOOL (^)(id item))conditionBlock;

- (instancetype)mk_select:(BOOL (^)(id item))conditionBlock;

- (BOOL)mk_all:(BOOL (^)(id item))conditionBlock;

- (BOOL)mk_any:(BOOL (^)(id item))conditionBlock;

- (BOOL)mk_none:(BOOL (^)(id item))conditionBlock;

@end
