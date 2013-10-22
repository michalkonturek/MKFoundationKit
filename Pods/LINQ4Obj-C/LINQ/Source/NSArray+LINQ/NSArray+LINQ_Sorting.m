//
//  NSArray+LINQ_Sorting.m
//  LINQ4Obj-C
//
//  Created by Michal Konturek on 23/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSArray+LINQ_Sorting.h"

@implementation NSArray (LINQ_Sorting)

- (instancetype)LINQ_orderByAscending {
    return [self sortedArrayUsingSelector:@selector(compare:)];
}

- (instancetype)LINQ_orderByDescending {
    return [[self LINQ_orderByAscending] LINQ_reverse];
}

- (instancetype)LINQ_orderByKey:(NSString *)key ascending:(BOOL)ascending {
    NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:key ascending:ascending];
    return [self sortedArrayUsingDescriptors:@[descriptor]];
}

- (instancetype)LINQ_reverse {
    return [[[self reverseObjectEnumerator] allObjects] mutableCopy];
}

@end