//
//  NSDictionary+LINQ_Quantifier.m
//  LINQ4Obj-C
//
//  Created by Michal Konturek on 13/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSDictionary+LINQ_Quantifier.h"

@implementation NSDictionary (LINQ_Quantifier)

- (BOOL)linq_all:(LINQKeyValueConditionBlock)conditionBlock {
    if (!conditionBlock) return YES;
    
    __block NSInteger failedCount = 0;
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if (!conditionBlock(key, obj)) failedCount++;
    }];
    
    return (failedCount == 0);
}

- (BOOL)linq_any:(LINQKeyValueConditionBlock)conditionBlock {
    if (!conditionBlock) return NO;
    
    __block BOOL result = NO;
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if (conditionBlock(key, obj)) result = YES;
    }];
    
    return result;
}

@end
