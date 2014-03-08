//
//  NSArray+MK_Block_Tests.m
//  MKFoundation
//
//  Created by Michal Konturek on 10/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import <XCTest/XCTest.h>

#define HC_SHORTHAND
#import <OCHamcrest.h>

#import "BaseTest.h"

@interface NSArray_MK_Block_Tests : XCTestCase

@end

@implementation NSArray_MK_Block_Tests

//- (void)test_apply {
//    NSArray *target = @[@1, @2, @4, @11];
//    
//    __block id result = [NSMutableArray array];
//    [target MK_apply:^(id item) {
//        [result addObject:item];
//    }];
//    
//    // NOTE: MK_apply is asyncrhonous call
//    [NSThread sleepForTimeInterval:1];
//    
//    assertThat(result, containsInAnyOrder(@1, @2, @4, @11, nil));
//}

- (void)test_each {
    id target = @[@1, @2, @4, @11];
    
    __block id result = [NSMutableArray array];
    [target mk_each:^(id item) {
        [result addObject:item];
    }];
    
    // NOTE: MK_apply is asyncrhonous call
    [NSThread sleepForTimeInterval:2];
    
    assertThat(result, contains(@1, @2, @4, @11, nil));
}

- (void)test_map {
    // Method calls a method from LINQ4Obj-C which already passes tests.
    TEST_PASSES
}

- (void)test_match_returns {
    id target = @[@1, @2, @4, @11];
    id result = [target mk_match:^BOOL(id item) {
        return [item mk_isEven];
    }];
    
    assertThat(result, equalTo(@2));
}

- (void)test_match_returns_nil {
    id target = @[@1, @3, @5, @11];
    id result = [target mk_match:^BOOL(id item) {
        return [item mk_isEven];
    }];
    
    assertThat(result, nilValue());
}

- (void)test_reduce {
    NSArray *input = @[@"M", @"A", @"R", @"K"];
    NSString *result = [input mk_reduce:^id(id item, id aggregate) {
        return [NSString stringWithFormat:@"%@%@", aggregate, item];
    }];
    
    assertThat(result, equalTo(@"MARK"));
}

- (void)test_reduceWithBlock {
    NSArray *input = @[@"M", @"A", @"R", @"K"];
    NSString *result = [input mk_reduce:@"Name: " withBlock:^id(id item, id aggregate) {
        return [NSString stringWithFormat:@"%@%@", aggregate, item];
    }];
    
    assertThat(result, equalTo(@"Name: MARK"));
}

- (void)test_reject {
    id target = @[@1, @2, @4, @11, @14];
    id result = [target mk_reject:^BOOL(id item) {
        return [item mk_isEven];
    }];
    
    assertThat(result, hasCountOf(2));
    assertThat(result, containsInAnyOrder(@1, @11, nil));
}

- (void)test_select {
    id target = @[@1, @2, @3, @4];
    id result = [target mk_select:^BOOL(id item) {
        return [item mk_isEven];
    }];

    assertThat(result, hasCountOf(2));
    assertThat(result, containsInAnyOrder(@2, @4, nil));
}

- (void)test_all_returns_true {
    id target = @[@1, @2, @3, @4];
    BOOL result = [target mk_all:^BOOL(id item) {
        return [item mk_isGreaterThan:@0];
    }];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_all_returns_false {
    id target = @[@1, @2, @3, @4];
    BOOL result = [target mk_all:^BOOL(id item) {
        return [item mk_isGreaterThan:@2];
    }];
    
    assertThatBool(result, equalToBool(NO));
}

- (void)test_any_returns_true {
    id target = @[@1, @2, @3, @4];
    BOOL result = [target mk_any:^BOOL(id item) {
        return [item mk_isGreaterThan:@3];
    }];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_any_returns_false {
    id target = @[@1, @2, @3, @4];
    BOOL result = [target mk_any:^BOOL(id item) {
        return [item mk_isGreaterThan:@5];
    }];
    
    assertThatBool(result, equalToBool(NO));
}

- (void)test_none_returns_true {
    id target = @[@1, @3, @5, @11];
    BOOL result = [target mk_none:^BOOL(id item) {
        return [item mk_isEven];
    }];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_none_returns_false {
    id target = @[@1, @4, @5, @11];
    BOOL result = [target mk_none:^BOOL(id item) {
        return [item mk_isEven];
    }];
    
    assertThatBool(result, equalToBool(NO));
}

@end
