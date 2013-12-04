//
//  NSArray+LINQ_Generation.m
//  LINQ4Obj-C
//
//  Created by Michal Konturek on 22/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSArray+LINQ_Generation.h"

@implementation NSArray (LINQ_Generation)

+ (instancetype)linq_empty {
    return [self array];
}

+ (instancetype)linq_from:(NSInteger)from to:(NSInteger)to {
    if (from == to) return [self array];
    
    NSInteger range = labs(from - to) + 1;
    NSInteger step = (from < to) ? 1 : -1;
    
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:range];
    for (NSInteger i = 0; i < range; i++) {
        [result addObject:[NSNumber numberWithInteger:from]];
        from += step;
    }
    
    return result;
}

+ (instancetype)linq_repeat:(id)element count:(NSInteger)count {
    if (count < 1) return [self linq_empty];
    if (!element) return [self linq_empty];
    
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:count];
    for (NSInteger i = 0; i < count; i++) {
        [result addObject:element];
    }
    return result;
}

+ (instancetype)linq_with:(LINQSelectorBlock)block count:(NSInteger)count {
    if (count < 1) return [self linq_empty];
    if (!block) return [self linq_empty];
    
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:count];
    for (NSInteger i = 0; i < count; i++) {
        [result addObject:block(@(i))];
    }
    return result;
}

@end

