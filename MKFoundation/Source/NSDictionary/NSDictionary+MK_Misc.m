//
//  NSDictionary+MK_Misc.m
//  MKFoundationKit
//
//  Created by Michal Konturek on 11/07/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSDictionary+MK.h"

#import "NSArray+MK.h"
#import "LINQ.h"

@implementation NSDictionary (MK_Misc)

- (NSMutableDictionary *)MK_dictionaryWithKeys:(NSArray *)keys {
    if ([keys MK_isEmpty]) return [NSMutableDictionary LINQ_empty];
    
    id result = [NSMutableDictionary dictionaryWithCapacity:[keys count]];
    for (NSString *key in keys) {
        id object = [self objectForKey:key];
        if (key != nil) {
            [result setObject:object forKey:key];
        }
    }
    
    return result;
}

- (NSMutableDictionary *)MK_renameKeysUsingMapping:(NSDictionary *)mapping {
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

- (BOOL)MK_isEmpty {
    return ([self count] == 0);
}

@end
