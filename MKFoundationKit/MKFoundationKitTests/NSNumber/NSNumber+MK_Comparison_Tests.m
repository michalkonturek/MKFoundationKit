//
//  NSNumber+MK_Comparison_Tests.m
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

@interface NSNumber_MK_Comparison_Tests : XCTestCase

@property (nonatomic, strong) NSArray *numbers;

@end

@implementation NSNumber_MK_Comparison_Tests

- (void)setUp {
    self.numbers = @[@1, @2, @10, @18];
}

- (void)tearDown {
    self.numbers = nil;
}

- (void)test_isTheSame_returns_true {
    BOOL result = [@10 mk_isTheSame:@10.0];
    assertThatBool(result, isTrue());
}

- (void)test_isTheSame_returns_false {
    BOOL result = [@10 mk_isTheSame:@10.1];
    assertThatBool(result, isFalse());
}

- (void)test_isGreaterThan_returns_true {
    BOOL result = [@100 mk_isGreaterThan:@10];
    assertThatBool(result, isTrue());
}

- (void)test_isGreaterThan_returns_false {
    BOOL result = [@10 mk_isGreaterThan:@10.08];
    assertThatBool(result, isFalse());
}

- (void)test_isLessThan_returns_true {
    BOOL result = [@10 mk_isLessThan:@18];
    assertThatBool(result, isTrue());
}

- (void)test_isLessThan_returns_false {
    BOOL result = [@19.5 mk_isLessThan:@18];
    assertThatBool(result, isFalse());
}

- (void)test_isEven_returns_true {
    BOOL result = [@22 mk_isEven];
    assertThatBool(result, isTrue());
}

- (void)test_isEven_returns_true_when_zero {
    BOOL result = [@0 mk_isEven];
    assertThatBool(result, isTrue());
}

- (void)test_isEven_returns_false {
    BOOL result = [@1 mk_isEven];
    assertThatBool(result, isFalse());
}

- (void)test_isOdd_returns_true {
    BOOL result = [@3 mk_isOdd];
    assertThatBool(result, isTrue());
}

- (void)test_isOdd_returns_true_when_fraction {
    BOOL result = [@2.2 mk_isOdd];
    assertThatBool(result, isTrue());
}

- (void)test_isOdd_returns_false {
    BOOL result = [@4 mk_isOdd];
    assertThatBool(result, isFalse());
}

@end
