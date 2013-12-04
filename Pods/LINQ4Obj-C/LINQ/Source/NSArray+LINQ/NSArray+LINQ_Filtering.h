//
//  NSArray+LINQ_Filtering.h
//  LINQ4Obj-C
//
//  Created by Michal Konturek on 22/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "LINQ.h"

@interface NSArray (LINQ_Filtering)

/**
 Selects values, depending on their ability to be cast to a specified type.
 */
- (instancetype)linq_ofType:(Class)klass;

/**
 Selects values that are based on a predicate function.
 */
- (instancetype)linq_where:(LINQConditionBlock)conditionBlock;

@end