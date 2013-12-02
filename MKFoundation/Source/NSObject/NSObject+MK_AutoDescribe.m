//
//  NSObject+MKDebugKit.m
//  MKDebugKit
//
//  Created by Michal Konturek on 20/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSObject+MK_AutoDescribe.h"

#import <objc/runtime.h>

@implementation NSObject (MK_AutoDescribe)

+ (NSArray *)MK_propertyList {
    return [self MK_propertyList:[self class]];
}

+ (NSArray *)MK_propertyList:(Class)clazz {
    NSUInteger count;
    objc_property_t *propertyList = class_copyPropertyList(clazz, &count);
    
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:count];
    for (NSInteger idx = 0; idx < count; idx++ ) {
        
        objc_property_t property = propertyList[idx];
        const char *propertyName = property_getName(property);
        
        if (propertyName) {
            [result addObject:[NSString stringWithCString:propertyName encoding:NSUTF8StringEncoding]];
        }
    }
    
    free(propertyList);
    
    return result;
}

+ (NSArray *)MK_methodListOnly {
    return [self MK_methodListOnly:[self class]];
}

+ (NSArray *)MK_methodListOnly:(Class)clazz {
    NSArray *properties = [self MK_propertyList:clazz];
    NSArray *methods = [self MK_methodList:clazz];
    
    NSMutableArray *result = [NSMutableArray arrayWithArray:methods];
    NSMutableArray *without = [NSMutableArray arrayWithArray:properties];
    
    [without addObject:@".cxx_destruct"];
    for (id item in properties) {
        [without addObject:[NSString stringWithFormat:@"set%@:", item]];
    }
    
    for (NSString *item in without) {
        [[result copy] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            if ([[item uppercaseString] isEqualToString:[obj uppercaseString]]) {
                [result removeObject:obj];
            }
        }];
    }
    
    return result;
}

+ (NSArray *)MK_methodList {
    return [self MK_methodList:[self class]];
}

+ (NSArray *)MK_methodList:(Class)clazz {
    NSUInteger count;
    Method *methods = class_copyMethodList(clazz, &count);
    
    NSMutableArray *results = [NSMutableArray arrayWithCapacity:count];
    for (int idx = 0; idx < count ; idx++) {
        SEL selector = method_getName(methods[idx]);
        [results addObject:NSStringFromSelector(selector)];
    }
    
    free(methods);
    
    return results;
}

- (void)MK_printObject {
    if ([self isKindOfClass:NSClassFromString(@"NSManagedObject")]) {
        NSLog(@"%@", [self description]);
        return;
    }
    
    [self MK_printObjectKeys:[[self class] MK_propertyList]];
}

- (void)MK_printObjectKeys:(NSArray *)keys {
    
    __block NSObject *blockSelf = self;
    [self _printElements:keys
              withHeader:@"attributes" withBlock:^(id item, id result) {
                  [result appendString:@"\n\t"];
                  [result appendString:[NSString stringWithFormat:@"%@ : %@",
                                        item, [blockSelf valueForKey:item]]];
              }];
}

- (void)MK_printObjectMethods {
    [self _printElements:[[self class] MK_methodList]
              withHeader:@"methods" withBlock:^(id item, id result) {
                  [result appendString:@"\n\t"];
                  [result appendString:item];
    }];
}

- (void)MK_printObjectMethodsOnly {
    [self _printElements:[[self class] MK_methodListOnly]
              withHeader:@"methods only" withBlock:^(id item, id result) {
                  [result appendString:@"\n\t"];
                  [result appendString:item];
    }];
}

- (void)_printElements:(NSArray *)elements
            withHeader:(NSString *)header withBlock:(void (^)(id item, id result))block {
    
    __block NSMutableString *result = [NSMutableString string];
    [result appendString:[NSString stringWithFormat:@"\n- - - > %@ %@: ", [self MK_className], header]];
    
    for (id item in elements) {
        block(item, result);
    }
    
    [result appendString:@"\n< - - -\n"];
    
    NSLog(@"%@", result);
}

- (NSString *)MK_className {
    return NSStringFromClass([self class]);
}

@end
