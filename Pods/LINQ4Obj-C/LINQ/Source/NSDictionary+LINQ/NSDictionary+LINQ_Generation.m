//
//  NSDictionary+LINQ_Generation.m
//  LINQ4Obj-C
//
//  Created by Michal Konturek on 12/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSDictionary+LINQ_Generation.h"

@implementation NSDictionary (LINQ_Generation)

+ (instancetype)LINQ_empty {
    return [self dictionary];
}

+ (instancetype)LINQ_from:(NSInteger)from to:(NSInteger)to {
    if (from == to) return [self LINQ_empty];
    
    NSInteger range = abs(from - to) + 1;
    NSInteger step = (from < to) ? 1 : -1;
    
    NSMutableDictionary *result = [NSMutableDictionary dictionaryWithCapacity:range];
    for (NSInteger i = 0; i < range; i++) {
        [result setObject:@(from) forKey:@(i)];
        from += step;
    }
    return result;
}

+ (instancetype)LINQ_repeat:(id)element count:(NSInteger)count {
    if (count < 1) return [self LINQ_empty];
    if (!element) return [self LINQ_empty];
    
    NSMutableDictionary *result = [NSMutableDictionary dictionaryWithCapacity:count];
    for (NSInteger i = 0; i < count; i++) {
        [result setObject:element forKey:@(i)];
    }
    return result;
}

+ (instancetype)LINQ_with:(LINQKeyValueSelectorBlock)block count:(NSInteger)count {
    METHOD_NOT_IMPLEMENTED
}

@end
