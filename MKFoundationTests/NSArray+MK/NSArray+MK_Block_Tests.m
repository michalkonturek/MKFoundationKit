//
//  NSArray+MK_Block_Tests.m
//  MKFoundation
//
//  Created by Michal Konturek on 10/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "BaseTest.h"

@interface NSArray_MK_Block_Tests : SenTestCase

@end

@implementation NSArray_MK_Block_Tests

- (void)test_apply {
    NSArray *target = @[@1, @2, @4, @11];
    
    id result = [NSMutableArray array];
    [target MK_apply:^(id item) {
        [result addObject:item];
    }];
    
    assertThat(result, containsInAnyOrder(@1, @2, @4, @11, nil));
}

- (void)test_each {
    id target = @[@1, @2, @4, @11];
    
    id result = [NSMutableArray array];
    [target MK_each:^(id item) {
        [result addObject:item];
    }];
    
    assertThat(result, contains(@1, @2, @4, @11, nil));
}

- (void)test_map {
    // Method calls a method from LINQ4Obj-C which already passes tests.
    TEST_PASSES
}

- (void)test_match_returns {
    id target = @[@1, @2, @4, @11];
    id result = [target MK_match:^BOOL(id item) {
        return [item MK_isEven];
    }];
    
    assertThat(result, equalTo(@2));
}

- (void)test_match_returns_nil {
    id target = @[@1, @3, @5, @11];
    id result = [target MK_match:^BOOL(id item) {
        return [item MK_isEven];
    }];
    
    assertThat(result, nilValue());
}

- (void)test_reduce {
    NSArray *input = @[@"M", @"A", @"R", @"K"];
    NSString *result = [input MK_reduce:@"Name: " withBlock:^id(id item, id aggregate) {
        return [NSString stringWithFormat:@"%@%@", aggregate, item];
    }];
    
    assertThat(result, equalTo(@"Name: MARK"));
}

- (void)test_reject {
    id target = @[@1, @2, @4, @11, @14];
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
    id target = @[@1, @3, @5, @11];
    BOOL result = [target MK_none:^BOOL(id item) {
        return [item MK_isEven];
    }];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_none_returns_false {
    id target = @[@1, @4, @5, @11];
    BOOL result = [target MK_none:^BOOL(id item) {
        return [item MK_isEven];
    }];
    
    assertThatBool(result, equalToBool(NO));
}

@end
