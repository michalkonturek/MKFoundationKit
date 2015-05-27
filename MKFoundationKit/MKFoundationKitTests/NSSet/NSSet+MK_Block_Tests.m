//
//  NSSet+MK_Block_Tests.m
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

@interface NSSet_MK_Block_Tests : XCTestCase

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
    assertThat(result, containsInAnyOrder(@2, @4, @8, @22, nil));
}

- (void)test_match_returns {
    id result = [self.input mk_match:^BOOL(id item) {
        return [item mk_isEven];
    }];
    
    assertThat(result, anyOf(equalTo(@2), equalTo(@4), nil));
}

- (void)test_match_returns_nil {
    NSSet *target = [NSSet setWithArray:@[@1, @3, @5, @11]];
    id result = [target mk_match:^BOOL(id item) {
        return [item mk_isEven];
    }];
    
    assertThat(result, nilValue());
}

- (void)test_reduce {
    NSSet *input = [[NSSet alloc] initWithArray:@[@"M", @"A", @"R", @"K"]];
    NSString *result = [input mk_reduce:@"X" withBlock:^id(id item, id aggregate) {
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
    id result = [target mk_reject:^BOOL(id item) {
        return [item mk_isEven];
    }];
    
    assertThat(result, hasCountOf(2));
    assertThat(result, containsInAnyOrder(@1, @11, nil));
}

- (void)test_select {
    id result = [self.input mk_select:^BOOL(id item) {
        return [item mk_isEven];
    }];

    assertThat(result, hasCountOf(2));
    assertThat(result, containsInAnyOrder(@2, @4, nil));
}

- (void)test_all_returns_true {
    NSSet *target = [NSSet setWithArray:@[@2, @4, @8, @22]];
    BOOL result = [target mk_all:^BOOL(id item) {
        return [item mk_isEven];
    }];
    
    assertThatBool(result, isTrue());
}

- (void)test_all_returns_false {
    NSSet *target = [NSSet setWithArray:@[@2, @4, @8, @31]];
    BOOL result = [target mk_all:^BOOL(id item) {
        return [item mk_isEven];
    }];
    
    assertThatBool(result, isFalse());
}

- (void)test_any_returns_true {
    NSSet *target = [NSSet setWithArray:@[@2, @4, @8, @31]];
    BOOL result = [target mk_any:^BOOL(id item) {
        return [item mk_isOdd];
    }];
    
    assertThatBool(result, isTrue());
}

- (void)test_any_returns_false {
    NSSet *target = [NSSet setWithArray:@[@2, @4, @8, @22]];
    BOOL result = [target mk_any:^BOOL(id item) {
        return [item mk_isOdd];
    }];
    
    assertThatBool(result, isFalse());
}

- (void)test_none_returns_true {
    NSSet *target = [NSSet setWithArray:@[@1, @3, @5, @11]];
    BOOL result = [target mk_none:^BOOL(id item) {
        return [item mk_isEven];
    }];
    
    assertThatBool(result, isTrue());
}

- (void)test_none_returns_false {
    NSSet *target = [NSSet setWithArray:@[@1, @4, @5, @11]];
    BOOL result = [target mk_none:^BOOL(id item) {
        return [item mk_isEven];
    }];
    
    assertThatBool(result, isFalse());
}

@end
