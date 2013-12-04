//
//  NSArray+LINQ_Filtering.m
//  LINQ4Obj-C
//
//  Created by Michal Konturek on 22/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSArray+LINQ_Filtering.h"

@implementation NSArray (LINQ_Filtering)

- (instancetype)linq_ofType:(Class)klass {
    
    return [self linq_where:^BOOL(id item) {
        return [[item class] isSubclassOfClass:klass];
    }];
}

- (instancetype)linq_where:(LINQConditionBlock)conditionBlock {
    if (!conditionBlock) return self;
    
    NSMutableArray *result = [NSMutableArray array];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if (conditionBlock(obj)) [result addObject:obj];
    }];
    return result;
}

@end
