//
//  NSObject+MK_AutoDescribe.h
//  MKFoundation
//
//  Created by Michal Konturek on 20/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (MK_AutoDescribe)

+ (NSArray *)mk_propertyList;
+ (NSArray *)mk_propertyList:(Class)clazz;

+ (NSArray *)mk_methodListOnly;
+ (NSArray *)mk_methodListOnly:(Class)clazz;

+ (NSArray *)mk_methodList;
+ (NSArray *)mk_methodList:(Class)clazz;

- (void)mk_printObject;
- (void)mk_printObjectKeys:(NSArray *)keys;

- (void)mk_printObjectMethods;
- (void)mk_printObjectMethodsOnly;

- (NSString *)mk_className;

@end
