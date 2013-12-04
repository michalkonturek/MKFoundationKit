//
//  NSDictionary+LINQ_Aggregation.m
//  LINQ4Obj-C
//
//  Created by Michal Konturek on 12/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSDictionary+LINQ_Aggregation.h"

@implementation NSDictionary (LINQ_Aggregation)

- (id)linq_aggregate:(LINQAccumulatorBlock)accumulatorBlock {
    if (!accumulatorBlock) return self;
    
    __block id accumulator = nil;
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id item, BOOL *stop) {
        if (!accumulator) accumulator = item;
        else accumulator = accumulatorBlock(item, accumulator);
    }];
    
    return accumulator;
}

- (id)linq_avg {
    if ([self _isEmpty]) return [NSDecimalNumber zero];
    
    id sum = [self linq_sum];
    NSDecimalNumber *result = [NSDecimalNumber decimalNumberWithDecimal:[sum decimalValue]];
    NSDecimalNumber *count = [NSDecimalNumber decimalNumberWithDecimal:
                              [[NSNumber numberWithInteger:[self count]] decimalValue]];
    
    return [result decimalNumberByDividingBy:count];
}

- (id)linq_avgForKey:(NSString *)key {
    return [self _aux_applyOperator:@"@avg" toKey:key];
}

- (NSUInteger)linq_count:(LINQConditionBlock)conditionBlock {
    return [[self linq_whereValue:conditionBlock] count];
}

- (id)linq_max {
    if ([self _isEmpty]) return [NSDecimalNumber zero];
    
    return [self linq_aggregate:^id(id item, id aggregate) {
        return ([item compare:aggregate] == NSOrderedDescending) ? item : aggregate;
    }];
}

- (id)linq_maxForKey:(NSString *)key {
    return [self _aux_applyOperator:@"@max" toKey:key];
}

- (id)linq_min {
    if ([self _isEmpty]) return [NSDecimalNumber zero];
    
    return [self linq_aggregate:^id(id item, id aggregate) {
        return ([item compare:aggregate] == NSOrderedAscending) ? item : aggregate;
    }];
}

- (id)linq_minForKey:(NSString *)key {
    return [self _aux_applyOperator:@"@min" toKey:key];
}

- (id)linq_sum {
    if ([self _isEmpty]) return [NSDecimalNumber zero];
    
    return [self linq_aggregate:^id(id item, id aggregate) {
        NSDecimalNumber *acc = [NSDecimalNumber
                                decimalNumberWithDecimal:[aggregate decimalValue]];
        return [acc decimalNumberByAdding:[NSDecimalNumber
                                           decimalNumberWithDecimal:[item decimalValue]]];
    }];
}

- (id)linq_sumForKey:(NSString *)key {
    return [self _aux_applyOperator:@"@sum" toKey:key];
}

- (id)_aux_applyOperator:(NSString *)op toKey:(NSString *)key {
    NSString *keyPath = [NSString stringWithFormat:@"%@.%@", op, key];
    return [[self allValues] valueForKeyPath:keyPath];
}

- (BOOL)_isEmpty {
    return (self.count == 0);
}

@end
