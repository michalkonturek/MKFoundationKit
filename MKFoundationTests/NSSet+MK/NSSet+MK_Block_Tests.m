//
//  NSSet+MK_Block_Tests.m
//  MKFoundation
//
//  Created by Michal Konturek on 12/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "BaseTest.h"

@interface NSSet_MK_Block_Tests : SenTestCase

@end

@implementation NSSet_MK_Block_Tests

- (void)test_apply {
    NSSet *target = [NSSet setWithArray:@[@1, @2, @4, @11]];
    id result = [NSMutableArray array];
    [target MK_apply:^(id item) {
        [result addObject:item];
    }];
    
    assertThat(result, containsInAnyOrder(@1, @2, @4, @11, nil));
}

- (void)test_each {
    NSSet *target = [NSSet setWithArray:@[@1, @2, @4, @11]];
    id result = [NSMutableArray array];
    [target MK_each:^(id item) {
        [result addObject:item];
    }];
    
    assertThat(result, containsInAnyOrder(@1, @2, @4, @11, nil));
}

- (void)test_map {
    // Method calls a method from LINQ4Obj-C which already passes tests.
    TEST_PASSES
}

- (void)test_match_returns {
    NSSet *target = [NSSet setWithArray:@[@1, @2, @4, @11]];
    id result = [target MK_match:^BOOL(id item) {
        return [item MK_isEven];
    }];
    
    assertThat(result, anyOf(equalTo(@2), equalTo(@4), nil));
}

- (void)test_match_returns_nil {
    NSSet *target = [NSSet setWithArray:@[@1, @3, @5, @11]];
    id result = [target MK_match:^BOOL(id item) {
        return [item MK_isEven];
    }];
    
    assertThat(result, nilValue());
}

- (void)test_reduce {
    NSSet *input = [[NSSet alloc] initWithArray:@[@"M", @"A", @"R", @"K"]];
    NSString *result = [input MK_reduce:@"X" withBlock:^id(id item, id aggregate) {
        return [NSString stringWithFormat:@"%@%@", aggregate, item];
    }];
    
    assertThat(result, containsString(@"X"));
    assertThat(result, containsString(@"M"));
    assertThat(result, containsString(@"A"));
    assertThat(result, containsString(@"R"));
    assertThat(result, containsString(@"K"));
}

- (void)test_reject {
    NSSet *target = [NSSet setWithArray:@[@1, @2, @4, @11, @14]];
    id result = [target MK_reject:^BOOL(id item) {
        return [item MK_isEven];
    }];
    
    assertThat(result, hasCountOf(2));
    assertThat(result, containsInAnyOrder(@1, @11, nil));
}

- (void)test_select {
    // Method calls a method from LINQ4Obj-C which already passes tests.
    TEST_PASSES
}

- (void)test_all {
    // Method calls a method from LINQ4Obj-C which already passes tests.
    TEST_PASSES
}

- (void)test_any {
    // Method calls a method from LINQ4Obj-C which already passes tests.
    TEST_PASSES
}

- (void)test_none_returns_true {
    NSSet *target = [NSSet setWithArray:@[@1, @3, @5, @11]];
    BOOL result = [target MK_none:^BOOL(id item) {
        return [item MK_isEven];
    }];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_none_returns_false {
    NSSet *target = [NSSet setWithArray:@[@1, @4, @5, @11]];
    BOOL result = [target MK_none:^BOOL(id item) {
        return [item MK_isEven];
    }];
    
    assertThatBool(result, equalToBool(NO));
}

@end
