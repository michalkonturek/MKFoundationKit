//
//  NSDictionary+LINQ_Sets.h
//  LINQ4Obj-C
//
//  Created by Michal Konturek on 13/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "LINQ.h"

@interface NSDictionary (LINQ_Sets)

/**
 Removes duplicate values from a collection.
 */
- (instancetype)linq_distinct;

/**
 Returns the collection without the elements
 that appear in a second collection.
 */
- (instancetype)linq_except:(NSDictionary *)other;

/**
 Returns the set intersection, which means elements
 that appear in each of two collections.
 */
- (instancetype)linq_intersect:(NSDictionary *)other;

/**
 Merges to dictionaries by returning the set union
 of unique elements which keys appear in either of
 two dictionaries.
 */
- (NSDictionary *)linq_merge:(NSDictionary *)other;

@end
