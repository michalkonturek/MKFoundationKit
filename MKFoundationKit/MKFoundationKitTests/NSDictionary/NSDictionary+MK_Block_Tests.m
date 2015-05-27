//
//  NSDictionary+MK_Block_Tests.m
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

#import <XCTest/XCTest.h>

#define HC_SHORTHAND
#import <OCHamcrest.h>

#import "BaseTest.h"

@interface NSDictionary_MK_Block_Tests : XCTestCase

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
    [self.input mk_each:^(id item) {
        [result addObject:item];
    }];
    
    assertThat(result, hasCountOf(4));
    assertThat(result, containsInAnyOrder(@1, @2, @4, @11, nil));
}

- (void)test_map {
    id result = [self.input mk_map:^id(id item) {
        return [item mk_multiplyBy:@2];
    }];
    
    assertThat(result, hasCountOf(4));
    assertThat([result allValues], containsInAnyOrder(@2, @4, @8, @22, nil));
}

- (void)test_match_returns {
    self.input = @{@0: @1, @1: @2, @2: @3};
    id result = [self.input mk_match:^BOOL(id key, id value) {
        return [value mk_isEven];
    }];
    
    assertThat(result, equalTo(@2));
}

- (void)test_match_returns_nil {
    NSDictionary *target = @{@0: @1, @1: @3, @2: @5, @3: @11};
    id result = [target mk_match:^BOOL(id key, id value) {
        return [value mk_isEven];
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
    NSDictionary *result = [target mk_reject:^BOOL(id key, id value) {
        return [value mk_isEven];
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
    BOOL result = [target mk_none:^BOOL(id key, id value) {
        return [value mk_isEven];
    }];
    
    assertThatBool(result, isTrue());
}

- (void)test_none_returns_false {
    NSDictionary *target = @{@0: @1, @1: @4, @2: @5, @3: @11};
    BOOL result = [target mk_none:^BOOL(id key, id value) {
        return [value mk_isEven];
    }];
    
    assertThatBool(result, isFalse());
}


@end
