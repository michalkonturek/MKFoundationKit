//
//  NSObject+MK_AutoDescribe.m
//  MKFoundation
//
//  Copyright (c) 2013 Michal Konturek
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "NSObject+MK_AutoDescribe.h"

#import <objc/runtime.h>

@implementation NSObject (MK_AutoDescribe)

+ (NSArray *)mk_propertyList {
    return [self mk_propertyList:[self class]];
}

+ (NSArray *)mk_propertyList:(Class)clazz {
    unsigned int count;
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

+ (NSArray *)mk_methodListOnly {
    return [self mk_methodListOnly:[self class]];
}

+ (NSArray *)mk_methodListOnly:(Class)clazz {
    NSArray *properties = [self mk_propertyList:clazz];
    NSArray *methods = [self mk_methodList:clazz];
    
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

+ (NSArray *)mk_methodList {
    return [self mk_methodList:[self class]];
}

+ (NSArray *)mk_methodList:(Class)clazz {
    unsigned int count;
    Method *methods = class_copyMethodList(clazz, &count);
    
    NSMutableArray *results = [NSMutableArray arrayWithCapacity:count];
    for (int idx = 0; idx < count ; idx++) {
        SEL selector = method_getName(methods[idx]);
        [results addObject:NSStringFromSelector(selector)];
    }
    
    free(methods);
    
    return results;
}

- (void)mk_printObject {
    if ([self isKindOfClass:NSClassFromString(@"NSManagedObject")]) {
        NSLog(@"%@", [self description]);
        return;
    }
    
    [self mk_printObjectKeys:[[self class] mk_propertyList]];
}

- (void)mk_printObjectKeys:(NSArray *)keys {
    
    __block NSObject *blockSelf = self;
    [self _printElements:keys
              withHeader:@"attributes" withBlock:^(id item, id result) {
                  [result appendString:@"\n\t"];
                  [result appendString:[NSString stringWithFormat:@"%@ : %@",
                                        item, [blockSelf valueForKey:item]]];
              }];
}

- (void)mk_printObjectMethods {
    [self _printElements:[[self class] mk_methodList]
              withHeader:@"methods" withBlock:^(id item, id result) {
                  [result appendString:@"\n\t"];
                  [result appendString:item];
    }];
}

- (void)mk_printObjectMethodsOnly {
    [self _printElements:[[self class] mk_methodListOnly]
              withHeader:@"methods only" withBlock:^(id item, id result) {
                  [result appendString:@"\n\t"];
                  [result appendString:item];
    }];
}

- (void)_printElements:(NSArray *)elements
            withHeader:(NSString *)header withBlock:(void (^)(id item, id result))block {
    
    __block NSMutableString *result = [NSMutableString string];
    [result appendString:[NSString stringWithFormat:@"\n- - - > %@ %@: ", [self mk_className], header]];
    
    for (id item in elements) {
        block(item, result);
    }
    
    [result appendString:@"\n< - - -\n"];
    
    NSLog(@"%@", result);
}

- (NSString *)mk_className {
    return NSStringFromClass([self class]);
}

@end
