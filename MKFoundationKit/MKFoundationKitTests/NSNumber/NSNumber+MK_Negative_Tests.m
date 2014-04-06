//
//  NSNumber+MK_Negative_Tests.m
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

@interface NSNumber_MK_Negative_Tests : XCTestCase

@end

@implementation NSNumber_MK_Negative_Tests

- (void)test_minus_one_when_nsnumber_instance {
    id result = [NSNumber mk_minusOne];
    assertThat(result, equalTo(@-1));
}

- (void)test_minus_one_when_nsdecimalnumber_instance {
    id result = [NSDecimalNumber mk_minusOne];
    assertThat(result, equalTo(@-1));
}

- (void)test_negative_when_positive {
    id result = [@1 mk_negative];
    assertThat(result, equalTo(@-1));
}

- (void)test_negative_when_negative {
    id result = [@-1 mk_negative];
    assertThat(result, equalTo(@-1));
}

- (void)test_positive_when_positive {
    id result = [@1 mk_positive];
    assertThat(result, equalTo(@1));
}

- (void)test_positive_when_negative {
    id result = [@-1 mk_positive];
    assertThat(result, equalTo(@1));
}

- (void)test_negate_when_nsnumber_instance {
    id result = [@1 mk_negate];
    assertThat(result, equalTo(@-1));
}

- (void)test_negate_when_nsdecimalnumber_instance {
    id result = [[NSDecimalNumber one] mk_negate];
    assertThat(result, equalTo(@-1));
}

- (void)test_isPositive_returns_true {
    BOOL result = [@1 mk_isPositive];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isPositive_returns_false {
    BOOL result = [[NSNumber mk_minusOne] mk_isPositive];
    assertThatBool(result, equalToBool(NO));
}

- (void)test_isNegative_returns_true {
    BOOL result = [[NSNumber mk_minusOne] mk_isNegative];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isNegative_returns_false {
    BOOL result = [@1 mk_isNegative];
    assertThatBool(result, equalToBool(NO));
}

@end
