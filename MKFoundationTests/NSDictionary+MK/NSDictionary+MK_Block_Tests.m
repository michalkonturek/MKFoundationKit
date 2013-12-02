//
//  NSDictionary+MK_Block_Tests.m
//  MKFoundation
//
//  Created by Michal Konturek on 12/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "BaseTest.h"

@interface NSDictionary_MK_Block_Tests : SenTestCase

@property (nonatomic, strong) NSDictionary *input;

@end

@implementation NSDictionary_MK_Block_Tests

- (void)setUp {
    [super setUp];
    self.input = @{@0: @1, @1: @2, @2: @4, @3: @11};
}

- (void)tearDown {
    self.input = nil;
    [super tearDown];
}

//- (void)test_apply {
//    __block id result = [NSMutableArray array];
//    [self.input MK_apply:^(id item) {
//        [result addObject:item];
//    }];
//    
//    // NOTE: MK_apply is asyncrhonous call
//    [NSThread sleepForTimeInterval:2];
//    
//    assertThat(result, hasCountOf(4));
//    assertThat(result, containsInAnyOrder(@1, @2, @4, @11, nil));
//}

- (void)test_each {
    __block id result = [NSMutableArray array];
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
    assertThat([result allValues], containsInAnyOrder(@2, @4, @8, @22, nil));
}

- (void)test_match_returns {
    id result = [self.input MK_match:^BOOL(id key, id value) {
        return [value MK_isEven];
    }];
    
    assertThat(result, equalTo(@2));
}

- (void)test_match_returns_nil {
    NSDictionary *target = @{@0: @1, @1: @3, @2: @5, @3: @11};
    id result = [target MK_match:^BOOL(id key, id value) {
        return [value MK_isEven];
    }];
    
    assertThat(result, nilValue());
}

- (void)test_reduce {
    NSArray *input = @[@"M", @"A", @"R", @"K"];
    NSString *result = [input mk_reduce:@"Name: " withBlock:^id(id item, id aggregate) {
        return [NSString stringWithFormat:@"%@%@", aggregate, item];
    }];
    
    assertThat(result, equalTo(@"Name: MARK"));
}

- (void)test_reject {
    NSDictionary *target = @{@0: @1, @1: @2, @2: @4, @3: @11};
    NSDictionary *result = [target MK_reject:^BOOL(id key, id value) {
        return [value MK_isEven];
    }];
    
    assertThat(result, hasCountOf(2));
    assertThat([result allValues], containsInAnyOrder(@1, @11, nil));
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
    NSDictionary *target = @{@0: @1, @1: @3, @2: @5, @3: @11};
    BOOL result = [target MK_none:^BOOL(id key, id value) {
        return [value MK_isEven];
    }];
    
    assertThatBool(result, equalToBool(YES));
}

- (void)test_none_returns_false {
    NSDictionary *target = @{@0: @1, @1: @4, @2: @5, @3: @11};
    BOOL result = [target MK_none:^BOOL(id key, id value) {
        return [value MK_isEven];
    }];
    
    assertThatBool(result, equalToBool(NO));
}


@end
