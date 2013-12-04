//
//  NSArray+LINQ_Sorting.h
//  LINQ4Obj-C
//
//  Created by Michal Konturek on 23/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSArray+LINQ.h"

@interface NSArray (LINQ_Sorting)

/**
 Sorts values in ascending order.
 */
- (instancetype)linq_orderByAscending;

/**
 Sorts values in descending order.
 */
- (instancetype)linq_orderByDescending;

/**
 Sorts elements of a collection depending on an element key.
 */
- (instancetype)linq_orderByKey:(NSString *)key ascending:(BOOL)ascending;

/**
 Reverses the order of the elements in a collection.
 */
- (instancetype)linq_reverse;

@end
