//
//  NSDictionary+LINQ_Filtering.h
//  LINQ4Obj-C
//
//  Created by Michal Konturek on 12/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "LINQ.h"

@interface NSDictionary (LINQ_Filtering)

/**
 Selects elements which keys can be cast to a specified type.
 */
- (instancetype)linq_ofTypeKey:(Class)klass;

/**
 Selects elements which values can be cast to a specified type.
 */
- (instancetype)linq_ofTypeValue:(Class)klass;

/**
 Selects values which satisify key-value condition.
 */
- (instancetype)linq_where:(LINQKeyValueConditionBlock)conditionBlock;

/**
 Selects values which keys satisify condition.
 */
- (instancetype)linq_whereKey:(LINQConditionBlock)conditionBlock;

/**
 Selects values which satisify condition.
 */
- (instancetype)linq_whereValue:(LINQConditionBlock)conditionBlock;

@end
