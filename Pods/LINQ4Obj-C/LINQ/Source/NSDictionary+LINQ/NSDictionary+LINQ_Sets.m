//
//  NSDictionary+LINQ_Sets.m
//  LINQ4Obj-C
//
//  Created by Michal Konturek on 13/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSDictionary+LINQ_Sets.h"

@implementation NSDictionary (LINQ_Sets)

- (instancetype)linq_distinct {
    if ([self _isEmpty]) return self;
    
    NSArray *values = [[self allValues] linq_distinct];
    return [self _aux_dictionary_with_values:values];
}

- (instancetype)linq_except:(NSDictionary *)other {
    if ([self _isEmpty]) return self;
    if (!other) return self;
    if ([other _isEmpty]) return self;
    
    NSArray *values = [[self allValues] linq_except:[other allValues]];
    return [self _aux_dictionary_with_values:values];
}

- (instancetype)linq_intersect:(NSDictionary *)other {
    if ([self _isEmpty]) return self;
    if (!other) return self;
    if ([other _isEmpty]) return self;
    
    NSArray *values = [[self allValues] linq_intersect:[other allValues]];
    return [self _aux_dictionary_with_values:values];
}

- (NSDictionary *)_aux_dictionary_with_values:(NSArray *)values {
    
    NSMutableDictionary *result = [NSMutableDictionary dictionary];
    for (id value in values) {
        for (id key in [self allKeys]) {
            if ([value isEqual:[self objectForKey:key]]) {
                [result setObject:value forKey:key];
                break;
            }
        }
    }
    return result;
}

- (NSDictionary *)linq_merge:(NSDictionary *)other {
    if ([self _isEmpty]) return other;
    if (!other) return self;
    if ([other _isEmpty]) return self;
    
    NSMutableDictionary *result = [NSMutableDictionary dictionaryWithDictionary:self];
    [other enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if (![result objectForKey:key]) [result setObject:obj forKey:key];
    }];
    
    return result;
}

- (BOOL)_isEmpty {
    return ([self count] == 0);
}

@end
