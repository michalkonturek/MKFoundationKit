//
//  NSArray+LINQ_Quantifier.h
//  LINQ4Obj-C
//
//  Created by Michal Konturek on 23/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "LINQ.h"

@interface NSArray (LINQ_Quantifier)

/**
 Determines whether all the elements in a sequence satisfy a condition.
 */
- (BOOL)linq_all:(LINQConditionBlock)conditionBlock;

/**
 Determines whether any elements in a sequence satisfy a condition.
 */
- (BOOL)linq_any:(LINQConditionBlock)conditionBlock;

@end
