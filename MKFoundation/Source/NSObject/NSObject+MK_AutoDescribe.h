//
//  NSObject+MKDebugKit.h
//  MKDebugKit
//
//  Created by Michal Konturek on 20/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSObject+MK.h"

@interface NSObject (MK_AutoDescribe)

+ (NSArray *)MK_propertyList;
+ (NSArray *)MK_propertyList:(Class)clazz;

+ (NSArray *)MK_methodListOnly;
+ (NSArray *)MK_methodListOnly:(Class)clazz;

+ (NSArray *)MK_methodList;
+ (NSArray *)MK_methodList:(Class)clazz;

- (void)MK_printObject;
- (void)MK_printObjectKeys:(NSArray *)keys;

- (void)MK_printObjectMethods;
- (void)MK_printObjectMethodsOnly;

- (NSString *)MK_className;

@end
