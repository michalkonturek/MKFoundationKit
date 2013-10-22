//
//  NSArray+LINQ_Generation.m
//  LINQ4Obj-C
//
//  Created by Michal Konturek on 22/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSArray+LINQ_Generation.h"

@implementation NSArray (LINQ_Generation)

+ (instancetype)LINQ_empty {
    return [self array];
}

+ (instancetype)LINQ_from:(NSInteger)from to:(NSInteger)to {
    if (from == to) return [self array];
    
    NSInteger range = abs(from - to) + 1;
    NSInteger step = (from < to) ? 1 : -1;
    
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:range];
    for (NSInteger i = 0; i < range; i++) {
        [result addObject:[NSNumber numberWithInteger:from]];
        from += step;
    }
    
    return result;
}

+ (instancetype)LINQ_repeat:(id)element count:(NSInteger)count {
    if (count < 1) return [self LINQ_empty];
    if (!element) return [self LINQ_empty];
    
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:count];
    for (NSInteger i = 0; i < count; i++) {
        [result addObject:element];
    }
    return result;
}

+ (instancetype)LINQ_with:(LINQSelectorBlock)block count:(NSInteger)count {
    if (count < 1) return [self LINQ_empty];
    if (!block) return [self LINQ_empty];
    
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:count];
    for (NSInteger i = 0; i < count; i++) {
        [result addObject:block(@(i))];
    }
    return result;
}

@end

