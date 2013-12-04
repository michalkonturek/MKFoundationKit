//
//  NSArray+LINQ_Converting.h
//  LINQ4Obj-C
//
//  Created by Michal Konturek on 23/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSArray+LINQ.h"

@interface NSArray (LINQ_Converting)

/**
 Puts elements into an index-key-based NSDictionary.
 */
- (NSDictionary *)linq_toDictionary;

/**
 Puts elements into a NSDictionary based on a key selector function.
 */
- (NSDictionary *)linq_toDictionaryWithKeySelector:(LINQSelectorBlock)keySelector;

/**
 Puts elements into a NSDictionary based on a key and value selector functions.
 */
- (NSDictionary *)linq_toDictionaryWithKeySelector:(LINQSelectorBlock)keySelector
                                     valueSelector:(LINQSelectorBlock)valueSelector;

@end
