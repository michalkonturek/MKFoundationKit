//
//  NSDictionary+MK_Block.m
//  MKFoundation
//
//  Created by Michal Konturek on 11/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSDictionary+MK_Block.h"

#import <LINQ4Obj-C/NSDictionary+LINQ.h>

@implementation NSDictionary (MK_Block)

- (void)mk_apply:(void (^)(id item))block {
    if (!block) return;
    
    [self enumerateKeysAndObjectsWithOptions:NSEnumerationConcurrent
                                  usingBlock:^(id key, id obj, BOOL *stop)
    {
        block(obj);
    }];
}

- (void)mk_each:(void (^)(id item))block {
    if (!block) return;
    
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        block(obj);
    }];
}

- (instancetype)mk_map:(id (^)(id item))selectorBlock {
    if (!selectorBlock) return [[self class] dictionary];
    
    NSMutableDictionary *result = [NSMutableDictionary dictionaryWithCapacity:self.count];
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [result setObject:selectorBlock(obj) forKey:key];
    }];
    
    return result;
}

- (id)mk_match:(BOOL (^)(id key, id value))conditionBlock {
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

- (id)mk_reduce:(id)initial withBlock:(id (^)(id item, id aggregate))accumulatorBlock {
    if (!accumulatorBlock) return self;
    
    __block id result = initial;
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        result = accumulatorBlock(obj, result);
    }];
    
    return result;
}

- (instancetype)mk_reject:(BOOL (^)(id key, id value))conditionBlock {
    return [self linq_where:^BOOL(id key, id value) {
        return (!conditionBlock(key, value));
    }];
}

- (instancetype)mk_select:(BOOL (^)(id key, id value))conditionBlock {
    return [self linq_where:conditionBlock];
}

- (BOOL)mk_all:(BOOL (^)(id key, id value))conditionBlock {
    return [self linq_all:conditionBlock];
}

- (BOOL)mk_any:(LINQKeyValueConditionBlock)conditionBlock {
    return [self linq_any:conditionBlock];
}

- (BOOL)mk_none:(LINQKeyValueConditionBlock)conditionBlock {
    return ![self linq_any:conditionBlock];
}

@end
