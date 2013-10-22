//
//  NSDictionary+MK.m
//
//  Created by Michal Konturek on 11/07/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSDictionary+MK.h"

@implementation NSDictionary (MK)

- (NSMutableDictionary *)renameKeysUsingRules:(NSDictionary *)rules {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithDictionary:self];
    
    id object = nil;
    NSString *newKey = nil;
    for (NSString *key in rules) {
        object = [dictionary objectForKey:key];
        newKey = [rules objectForKey:key];
        if (object != nil) {
            [dictionary removeObjectForKey:key];
            [dictionary setObject:object forKey:newKey];
        }
    }
    
    return dictionary;
}

- (NSMutableDictionary *)dictionaryWithKeys:(NSArray *)keys {
    NSAssert(keys != nil, @"Keys cannot be nil");
    
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithCapacity:[keys count]];
    for (NSString *key in keys) {
        id object = [self objectForKey:key];
        if (key != nil) {
            [dictionary setObject:object forKey:key];
        }
    }
    
    return dictionary;
}

@end
