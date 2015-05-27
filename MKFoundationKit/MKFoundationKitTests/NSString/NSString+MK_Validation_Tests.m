//
//  NSString+MK_Validation_Tests.m
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

@interface NSString_MK_Validation_Tests : XCTestCase

@end

@implementation NSString_MK_Validation_Tests

- (void)test_isValidEmail_returns_true {
    BOOL result = [@"user@domain.com" mk_isValidEmail];
    assertThatBool(result, isTrue());
}

- (void)test_isValidEmail_returns_true_when_domain_is_two_parts {
    BOOL result = [@"user@email.domain.com" mk_isValidEmail];
    assertThatBool(result, isTrue());
}

- (void)test_isValidEmail_returns_true_when_domain_is_three_parts {
    BOOL result = [@"user@email.subdomain.domain.com" mk_isValidEmail];
    assertThatBool(result, isTrue());
}

- (void)test_isValidEmail_returns_false_when_no_at {
    BOOL result = [@"user.domain.com" mk_isValidEmail];
    assertThatBool(result, isFalse());
}

- (void)test_isValidEmail_returns_false_when_too_long_ending {
    BOOL result = [@"user@domain.comcom" mk_isValidEmail];
    assertThatBool(result, isFalse());
}

@end
