//
//  NSArray+LINQ_Grouping.h
//  LINQ4Obj-C
//
//  Created by Michal Konturek on 22/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSArray+LINQ.h"

@interface NSArray (LINQ_Grouping)

/**
 Returns NSDictionary of groups that share a common
 attribute defined by selector. Each group is defined
 as a dictionary etnry whose key is a result of a selector
 and its value is an array of all elements that return
 the same key, i.e. selector(element) -> key.
 
 {
 key <- selector(element)
 value <- [element : key == selector(element)]
 }
 
 */
- (NSDictionary *)linq_groupBy:(LINQSelectorBlock)selector;

/**
 Returns array of NSDictionaries by entering each element
 into a NSDictionary whose key is a result of a selector
 and its value is an element.
 
 {
 key <- selector(element)
 value <- element
 }
 
 */
- (instancetype)linq_toLookup:(LINQSelectorBlock)selector;

/**
 Helps to filter results of toLookup: method.
 Returns array of NSDictionaries with the same key.
 */
- (instancetype)linq_lookup:(id)key;


@end
