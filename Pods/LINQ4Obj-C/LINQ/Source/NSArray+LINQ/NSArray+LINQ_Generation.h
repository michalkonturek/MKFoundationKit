//
//  NSArray+LINQ_Generation.h
//  LINQ4Obj-C
//
//  Created by Michal Konturek on 22/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "LINQ.h"

@interface NSArray (LINQ_Generation)

/**
 Returns empty array.
 */
+ (instancetype)linq_empty;

/**
 Creates array with integers from to.
 */
+ (instancetype)linq_from:(NSInteger)from to:(NSInteger)to;

/**
 Generates a collection that contains one repeated value.
 */
+ (instancetype)linq_repeat:(id)element count:(NSInteger)count;

/**
 TBC
 */
+ (instancetype)linq_with:(LINQSelectorBlock)block count:(NSInteger)count;

@end
