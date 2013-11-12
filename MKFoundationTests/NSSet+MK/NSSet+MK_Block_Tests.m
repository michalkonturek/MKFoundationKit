//
//  NSSet+MK_Block_Tests.m
//  MKFoundation
//
//  Created by Michal Konturek on 12/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "BaseTest.h"

@interface NSSet_MK_Block_Tests : SenTestCase

@property (nonatomic, strong) NSSet *input;

@end

@implementation NSSet_MK_Block_Tests

- (void)setUp {
    [super setUp];
    self.input = [NSSet setWithArray:@[@1, @2, @4, @11]];
}

- (void)tearDown {
    self.input = nil;
    [super tearDown];
}

- (void)test_apply {
    id result = [NSMutableArray array];
    [self.input MK_apply:^(id item) {
        [result addObject:item];
    }];
    
    assertThat(result, hasCountOf(4));
    assertThat(result, containsInAnyOrder(@1, @2, @4, @11, nil));
}

- (void)test_each {
    id result = [NSMutableArray array];
    [self.input MK_each:^(id item) {
        [result addObject:item];
    }];
    
    assertThat(result, hasCountOf(4));
    assertThat(result, containsInAnyOrder(@1, @2, @4, @11, nil));
}

- (void)test_map {
    id result = [self.input MK_map:^id(id item) {
        return [item MK_multiplyBy:@2];
    }];
    
    assertThat(result, hasCountOf(4));
    assertThat(result, containsInAnyOrder(@2, @4, @8, @22, nil));
}

- (void)test_match_returns {
    id result = [self.input MK_match:^BOOL(id item) {
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
    id result = [self.input MK_select:^BOOL(id item) {
        return [item MK_isEven];
    }];

    assertThat(result, hasCountOf(2));
    assertThat(result, containsInAnyOrder(@2, @4, nil));
}

- (void)test_all_returns_true {
    NSSet *target = [NSSet setWithArray:@[@2, @4, @8, @22]];
    BOOL result = [target MK_all:^BOOL(id item) {
        return [item MK_isEven];
    }];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_all_returns_false {
    NSSet *target = [NSSet setWithArray:@[@2, @4, @8, @31]];
    BOOL result = [target MK_all:^BOOL(id item) {
        return [item MK_isEven];
    }];
    
    assertThatBool(result, equalToBool(NO));
}

- (void)test_any_returns_true {
    NSSet *target = [NSSet setWithArray:@[@2, @4, @8, @31]];
    BOOL result = [target MK_any:^BOOL(id item) {
        return [item MK_isOdd];
    }];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_any_returns_false {
    NSSet *target = [NSSet setWithArray:@[@2, @4, @8, @22]];
    BOOL result = [target MK_any:^BOOL(id item) {
        return [item MK_isOdd];
    }];
    
    assertThatBool(result, equalToBool(NO));
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
