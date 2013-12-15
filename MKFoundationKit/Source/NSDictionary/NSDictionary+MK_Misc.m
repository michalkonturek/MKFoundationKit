//
//  NSDictionary+MK_Misc.m
//  MKFoundationKit
//
//  Created by Michal Konturek on 11/07/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSDictionary+MK.h"

@implementation NSDictionary (MK_Misc)

- (NSMutableDictionary *)mk_dictionaryWithKeys:(NSArray *)keys {
    if ([keys count] == 0) return [NSMutableDictionary dictionary];
    
    id result = [NSMutableDictionary dictionaryWithCapacity:[keys count]];
    for (NSString *key in keys) {
        id object = [self objectForKey:key];
        if (key != nil) {
            [result setObject:object forKey:key];
        }
    }
    
    return result;
}

- (NSMutableDictionary *)mk_renameKeysUsingMapping:(NSDictionary *)mapping {
    id result = [NSMutableDictionary dictionaryWithDictionary:self];
    
    id object = nil;
    NSString *newKey = nil;
    for (NSString *key in mapping) {
        object = [result objectForKey:key];
        newKey = [mapping objectForKey:key];
        if (object != nil) {
            [result removeObjectForKey:key];
            [result setObject:object forKey:newKey];
        }
    }
    
    return result;
}

- (BOOL)mk_isEmpty {
    return ([self count] == 0);
}

@end
