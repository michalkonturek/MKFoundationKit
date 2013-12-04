//
//  NSArray+LINQ_Sets.h
//  LINQ4Obj-C
//
//  Created by Michal Konturek on 23/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "LINQ.h"

@interface NSArray (LINQ_Sets)

/**
 Removes duplicate values from a collection.
 */
- (instancetype)linq_distinct;

/**
 Returns the collection without the elements
 that appear in a second collection.
 */
- (instancetype)linq_except:(NSArray *)other;

/**
 Returns the set intersection, which means elements
 that appear in each of two collections.
 */
- (instancetype)linq_intersect:(NSArray *)other;

/**
 Returns the set union, which means unique elements
 that appear in either of two collections.
 */
- (NSArray *)linq_union:(NSArray *)other;

@end
