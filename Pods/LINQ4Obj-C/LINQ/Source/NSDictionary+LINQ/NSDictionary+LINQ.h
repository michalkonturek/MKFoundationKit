//
//  NSDictionary+LINQ.h
//  LINQ4Obj-C
//
//  Created by Michal Konturek on 22/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

//typedef id (^LINQKeyValueAccumulatorBlock)(id item, id aggregate);

typedef BOOL (^LINQKeyValueConditionBlock)(id key, id value);

typedef id (^LINQKeyValueSelectorBlock)(id key, id value);

#import "NSDictionary+LINQ_Aggregation.h"
#import "NSDictionary+LINQ_Converting.h"
#import "NSDictionary+LINQ_Filtering.h"
#import "NSDictionary+LINQ_Generation.h"
#import "NSDictionary+LINQ_Partitioning.h"
#import "NSDictionary+LINQ_Quantifier.h"
#import "NSDictionary+LINQ_Sets.h"
