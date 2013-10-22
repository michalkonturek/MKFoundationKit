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
- (instancetype)LINQ_ofType:(Class)klass;

/**
 Selects values that are based on a predicate function.
 */
- (instancetype)LINQ_where:(LINQConditionBlock)conditionBlock;

@end