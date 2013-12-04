//
//  NSArray+LINQ_Partitioning.h
//  LINQ4Obj-C
//
//  Created by Michal Konturek on 22/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "LINQ.h"

@interface NSArray (LINQ_Partitioning)

/**
 Skips elements up to a specified position in a collection.
 */
- (NSArray *)linq_skip:(NSInteger)count;

/**
 Takes elements up to a specified position in a collection.
 */
- (NSArray *)linq_take:(NSInteger)count;

@end
