//
//  NSDictionary+MK_Block.m
//  MKFoundation
//
//  Created by Michal Konturek on 11/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSDictionary+MK_Block.h"

@implementation NSDictionary (MK_Block)

- (void)mk_apply:(MKItemBlock)block {
    if (!block) return;
    
    [self enumerateKeysAndObjectsWithOptions:NSEnumerationConcurrent
                                  usingBlock:^(id key, id obj, BOOL *stop)
    {
        block(obj);
    }];
}

- (void)mk_each:(MKItemBlock)block {
    if (!block) return;
    
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        block(obj);
    }];
}

- (instancetype)mk_map:(LINQSelectorBlock)selectorBlock {
    if (!selectorBlock) return [[self class] dictionary];
    
    NSMutableDictionary *result = [NSMutableDictionary dictionaryWithCapacity:self.count];
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [result setObject:selectorBlock(obj) forKey:key];
    }];
    
    return result;
}

- (id)mk_match:(LINQKeyValueConditionBlock)conditionBlock {
    if (!conditionBlock) return self;
    
    __block id result = nil;
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if (conditionBlock(key, obj)) {
            result = obj;
            *stop = YES;
        }
    }];
    
    return result;
}

- (id)mk_reduce:(id)initial withBlock:(LINQAccumulatorBlock)accumulatorBlock {
    if (!accumulatorBlock) return self;
    
    __block id result = initial;
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        result = accumulatorBlock(obj, result);
    }];
    
    return result;
}

- (instancetype)mk_reject:(LINQKeyValueConditionBlock)conditionBlock {
    return [self LINQ_where:^BOOL(id key, id value) {
        return (!conditionBlock(key, value));
    }];
}

- (instancetype)mk_select:(LINQKeyValueConditionBlock)conditionBlock {
    return [self LINQ_where:conditionBlock];
}

- (BOOL)mk_all:(LINQKeyValueConditionBlock)conditionBlock {
    return [self LINQ_all:conditionBlock];
}

- (BOOL)mk_any:(LINQKeyValueConditionBlock)conditionBlock {
    return [self LINQ_any:conditionBlock];
}

- (BOOL)mk_none:(LINQKeyValueConditionBlock)conditionBlock {
    return ![self LINQ_any:conditionBlock];
}

@end
