//
//  NSArray+LINQ_Sorting.m
//  LINQ4Obj-C
//
//  Created by Michal Konturek on 23/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSArray+LINQ_Sorting.h"

@implementation NSArray (LINQ_Sorting)

- (instancetype)linq_orderByAscending {
    return [self sortedArrayUsingSelector:@selector(compare:)];
}

- (instancetype)linq_orderByDescending {
    return [[self linq_orderByAscending] linq_reverse];
}

- (instancetype)linq_orderByKey:(NSString *)key ascending:(BOOL)ascending {
    NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:key ascending:ascending];
    return [self sortedArrayUsingDescriptors:@[descriptor]];
}

- (instancetype)linq_reverse {
    return [[[self reverseObjectEnumerator] allObjects] mutableCopy];
}

@end