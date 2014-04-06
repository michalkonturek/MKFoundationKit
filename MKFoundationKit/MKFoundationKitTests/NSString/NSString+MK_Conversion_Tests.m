//
//  NSString+MK_Conversion_Tests.m
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

@interface NSString_MK_Conversion_Tests : XCTestCase

@end

@implementation NSString_MK_Conversion_Tests

- (void)test_numberWithInteger_when_numeric {
    NSString *input = @"101";
    NSNumber *result = [input mk_numberWithInteger];
    assertThat(result, equalTo(@101));
}

- (void)test_numberWithInteger_when_alphanumeric {
    NSString *input = @"101 ABCD";
    NSNumber *result = [input mk_numberWithInteger];
    assertThat(result, equalTo(@101));
}

- (void)test_numberWithLongLong_when_numeric {
    NSString *input = @"101111111111";
    NSNumber *result = [input mk_numberWithLongLong];
    assertThat(result, equalTo(@101111111111));
}

- (void)test_numberWithLongLong_when_alphanumeric {
    NSString *input = @"101111111111 ABCD";
    NSNumber *result = [input mk_numberWithLongLong];
    assertThat(result, equalTo(@101111111111));
}

@end
