//
//  NSDictionary+LINQ_Filtering.m
//  LINQ4Obj-C
//
//  Created by Michal Konturek on 12/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSDictionary+LINQ_Filtering.h"

@implementation NSDictionary (LINQ_Filtering)

- (instancetype)LINQ_ofTypeKey:(Class)klass {
    
    return [self LINQ_whereKey:^BOOL(id item) {
        return [[item class] isSubclassOfClass:klass];
    }];
}

- (instancetype)LINQ_ofTypeValue:(Class)klass {
    
    return [self LINQ_whereValue:^BOOL(id item) {
        return [[item class] isSubclassOfClass:klass];
    }];
}

- (instancetype)LINQ_where:(LINQKeyValueConditionBlock)conditionBlock {
    if (!conditionBlock) return self;
    
    NSMutableDictionary *result = [NSMutableDictionary dictionary];
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if (conditionBlock(key, obj)) [result setObject:obj forKey:key];
    }];
    return result;
}

- (instancetype)LINQ_whereKey:(LINQConditionBlock)conditionBlock {
    if (!conditionBlock) return self;
    
    NSMutableDictionary *result = [NSMutableDictionary dictionary];
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if (conditionBlock(key)) [result setObject:obj forKey:key];
    }];
    return result;
}

- (instancetype)LINQ_whereValue:(LINQConditionBlock)conditionBlock {
    if (!conditionBlock) return self;
    
    NSMutableDictionary *result = [NSMutableDictionary dictionary];
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if (conditionBlock(obj)) [result setObject:obj forKey:key];
    }];
    return result;
}

@end
