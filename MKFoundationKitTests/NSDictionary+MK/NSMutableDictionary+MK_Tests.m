//
//  NSMutableDictionary+MK_Tests.m
//  MKFoundation
//
//  Created by Michal Konturek on 25/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "BaseTest.h"

@interface NSMutableDictionary_MK_Tests : XCTestCase

@end

@implementation NSMutableDictionary_MK_Tests

- (void)test_safeAddObject_when_both_key_nil {
    NSMutableDictionary *result = [NSMutableDictionary LINQ_empty];
    [result mk_safeSetObject:nil forKey:@"Object"];
    assertThat(result, hasCountOf(0));
}

- (void)test_safeAddObject_when_both_object_nil {
    NSMutableDictionary *result = [NSMutableDictionary LINQ_empty];
    [result mk_safeSetObject:@"Key" forKey:nil];
    assertThat(result, hasCountOf(0));
}

- (void)test_safeAddObject_when_both_key_and_object_nil {
    NSMutableDictionary *result = [NSMutableDictionary LINQ_empty];
    [result mk_safeSetObject:nil forKey:nil];
    assertThat(result, hasCountOf(0));
}

@end
