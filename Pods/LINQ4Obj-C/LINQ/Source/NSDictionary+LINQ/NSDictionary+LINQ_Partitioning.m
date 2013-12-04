//
//  NSDictionary+LINQ_Partitioning.m
//  LINQ4Obj-C
//
//  Created by Michal Konturek on 13/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSDictionary+LINQ_Partitioning.h"

@implementation NSDictionary (LINQ_Partitioning)

- (instancetype)linq_skip:(NSInteger)count {
    if (count >= self.count) return [[self class] linq_empty];
    
    __block NSInteger idx = 1;
    id result = [[self class] linq_empty];
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if (idx > count) [result setObject:obj forKey:key];
        idx++;
    }];
    return result;
}

- (instancetype)linq_take:(NSInteger)count {
    if (count >= self.count) return [[self class] linq_empty];
    
    __block NSInteger idx = 1;
    id result = [[self class] linq_empty];
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if (idx <= count) [result setObject:obj forKey:key];
        idx++;
    }];
    return result;
}

@end
