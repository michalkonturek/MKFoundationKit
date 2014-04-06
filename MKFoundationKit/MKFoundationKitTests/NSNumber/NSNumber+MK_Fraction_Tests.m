//
//  NSNumber+MK_Fraction_Tests.m
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

@interface NSNumber_MK_Fraction_Tests : XCTestCase

@end

@implementation NSNumber_MK_Fraction_Tests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)test_integralPart_when_fraction {
    NSNumber *input = @1.1;
    NSNumber *result = [input mk_integralPart];
    assertThat(result, equalToInteger(1));
}

- (void)test_integralPart_when_integer {
    NSNumber *input = @1;
    NSNumber *result = [input mk_integralPart];
    assertThat(result, equalToInteger(1));
}

- (void)test_fractionalPart_when_fraction {
    NSNumber *input = @1.1;
    NSNumber *result = [input mk_fractionalPart];
    assertThat(result, equalToDouble(0.1));
}

- (void)test_fractionalPart_when_integer {
    NSNumber *input = @1;
    NSNumber *result = [input mk_fractionalPart];
    assertThat(result, equalToDouble(0));
}

- (void)test_isInteger_returns_true {
    NSNumber *input = @1;
    BOOL result = [input mk_isInteger];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isInteger_returns_false {
    NSNumber *input = @1.1;
    BOOL result = [input mk_isInteger];
    assertThatBool(result, equalToBool(NO));
}

- (void)test_isFractional_returns_true {
    NSNumber *input = @1.1;
    BOOL result = [input mk_isFraction];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isFractional_returns_false {
    NSNumber *input = @1;
    BOOL result = [input mk_isFraction];
    assertThatBool(result, equalToBool(NO));
}

@end
