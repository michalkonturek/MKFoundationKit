//
//  NSDictionary+LINQ_Converting.h
//  LINQ4Obj-C
//
//  Created by Michal Konturek on 12/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "LINQ.h"

@interface NSDictionary (LINQ_Converting)

/**
 Puts value elements into an NSArray.
 */
- (NSArray *)LINQ_toArray;

/**
 Puts value elements into a NSArray which satisfy key condtion.
 */
- (NSArray *)LINQ_toArrayWhereKey:(LINQConditionBlock)conditionBlock;

/**
 Puts value elements into a NSArray which satisfy value condtion.
 */
- (NSArray *)LINQ_toArrayWhereValue:(LINQConditionBlock)conditionBlock;

/**
 Puts value elements into a NSArray which satisfy both key and value condtion.
 */
- (NSArray *)LINQ_toArrayWhereKeyValue:(LINQKeyValueConditionBlock)conditionBlock;

@end
