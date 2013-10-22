//
//  NSArray+LINQ_Converting.m
//  LINQ4Obj-C
//
//  Created by Michal Konturek on 23/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSArray+LINQ_Converting.h"

@implementation NSArray (LINQ_Converting)

- (NSDictionary *)LINQ_toDictionary {
    return [self LINQ_toDictionaryWithKeySelector:nil valueSelector:nil];
}

- (NSDictionary *)LINQ_toDictionaryWithKeySelector:(LINQSelectorBlock)keySelector {
    return [self LINQ_toDictionaryWithKeySelector:keySelector valueSelector:nil];
}

- (NSDictionary *)LINQ_toDictionaryWithKeySelector:(LINQSelectorBlock)keySelector
                                     valueSelector:(LINQSelectorBlock)valueSelector {
    NSMutableDictionary *result = [NSMutableDictionary dictionary];
    
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        id key = (keySelector) ? keySelector(obj) : [NSNumber numberWithInteger:idx];
        id value = (valueSelector) ? valueSelector(obj) : obj;
        [result setObject:value forKey:key];
    }];
    
    return result;
}

@end
