//
//  NSArray+LINQ_Aggregation.m
//  LINQ4Obj-C
//
//  Created by Michal Konturek on 22/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSArray+LINQ_Aggregation.h"

@implementation NSArray (LINQ_Aggregation)

- (id)LINQ_aggregate:(LINQAccumulatorBlock)accumulatorBlock {
    if (!accumulatorBlock) return self;
    
    id accumulator = nil;
    for (id item in self) {
        if (!accumulator) accumulator = item;
        else accumulator = accumulatorBlock(item, accumulator);
    }
    return accumulator;
}

- (id)LINQ_avg {
    if ([self _isEmpty]) return [NSDecimalNumber zero];
    
    id sum = [self LINQ_sum];    
    NSDecimalNumber *result = [NSDecimalNumber decimalNumberWithDecimal:[sum decimalValue]];
    NSDecimalNumber *count = [NSDecimalNumber decimalNumberWithDecimal:
                              [[NSNumber numberWithInteger:[self count]] decimalValue]];
    
    return [result decimalNumberByDividingBy:count];
}

- (id)LINQ_avgForKey:(NSString *)key {
    return [self _aux_applyOperator:@"@avg" toKey:key];
}

- (NSUInteger)LINQ_count:(LINQConditionBlock)conditionBlock {
    return [[self LINQ_where:conditionBlock] count];
}

- (id)LINQ_max {
    if ([self _isEmpty]) return [NSDecimalNumber zero];
    
    return [self LINQ_aggregate:^id(id item, id aggregate) {
        return ([item compare:aggregate] == NSOrderedDescending) ? item : aggregate;
    }];
}

- (id)LINQ_maxForKey:(NSString *)key {
    return [self _aux_applyOperator:@"@max" toKey:key];
}

- (id)LINQ_min {
    if ([self _isEmpty]) return [NSDecimalNumber zero];
    
    return [self LINQ_aggregate:^id(id item, id aggregate) {
        return ([item compare:aggregate] == NSOrderedAscending) ? item : aggregate;
    }];
}

- (id)LINQ_minForKey:(NSString *)key {
    return [self _aux_applyOperator:@"@min" toKey:key];
}

- (id)LINQ_sum {
    if ([self _isEmpty]) return [NSDecimalNumber zero];
    
    return [self LINQ_aggregate:^id(id item, id aggregate) {
        NSDecimalNumber *acc = [NSDecimalNumber
                                decimalNumberWithDecimal:[aggregate decimalValue]];
        return [acc decimalNumberByAdding:[NSDecimalNumber
                                    decimalNumberWithDecimal:[item decimalValue]]];
    }];
}

- (id)LINQ_sumForKey:(NSString *)key {
    return [self _aux_applyOperator:@"@sum" toKey:key];
}

- (id)_aux_applyOperator:(NSString *)op toKey:(NSString *)key {
    NSString *keyPath = [NSString stringWithFormat:@"%@.%@", op, key];
    return [self valueForKeyPath:keyPath];
}

- (BOOL)_isEmpty {
    return (self.count == 0);
}

@end
