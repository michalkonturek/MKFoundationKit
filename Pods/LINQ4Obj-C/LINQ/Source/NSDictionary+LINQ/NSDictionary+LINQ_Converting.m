//
//  NSDictionary+LINQ_Converting.m
//  LINQ4Obj-C
//
//  Created by Michal Konturek on 12/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSDictionary+LINQ_Converting.h"

@implementation NSDictionary (LINQ_Converting)

- (NSArray *)LINQ_toArray {
    return [self LINQ_toArrayWhereKey:nil];
}

- (NSArray *)LINQ_toArrayWhereKey:(LINQConditionBlock)conditionBlock {
    if (!conditionBlock) conditionBlock = ^BOOL(id item) { return YES; };
    
    NSMutableArray *result = [NSMutableArray array];
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if (conditionBlock(key)) [result addObject:obj];
    }];
    
    return result;
}

- (NSArray *)LINQ_toArrayWhereValue:(LINQConditionBlock)conditionBlock {
    if (!conditionBlock) conditionBlock = ^BOOL(id item) { return YES; };
    
    NSMutableArray *result = [NSMutableArray array];
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if (conditionBlock(obj)) [result addObject:obj];
    }];
    
    return result;
}

- (NSArray *)LINQ_toArrayWhereKeyValue:(LINQKeyValueConditionBlock)conditionBlock {
    if (!conditionBlock) conditionBlock = ^BOOL(id key, id value) { return YES; };
    
    NSMutableArray *result = [NSMutableArray array];
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if (conditionBlock(key, obj)) [result addObject:obj];
    }];
    
    return result;
}

@end
