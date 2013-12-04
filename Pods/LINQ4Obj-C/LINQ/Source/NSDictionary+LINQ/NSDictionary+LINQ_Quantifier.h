//
//  NSDictionary+LINQ_Quantifier.h
//  LINQ4Obj-C
//
//  Created by Michal Konturek on 13/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "LINQ.h"

@interface NSDictionary (LINQ_Quantifier)

/**
 Determines whether all the elements in a sequence satisfy a condition.
 */
- (BOOL)linq_all:(LINQKeyValueConditionBlock)conditionBlock;

/**
 Determines whether any elements in a sequence satisfy a condition.
 */
- (BOOL)linq_any:(LINQKeyValueConditionBlock)conditionBlock;

@end
