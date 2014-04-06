//
//  NSString_MK_Empty_Tests
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

@interface NSString_MK_Empty_Tests : XCTestCase

@end

@implementation NSString_MK_Empty_Tests

- (void)test_isStringEmptyOrNil_returns_true {
    BOOL result = [NSString mk_isStringEmptyOrNil:@""];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isStringEmptyOrNil_returns_true_when_spaces {
    BOOL result = [NSString mk_isStringEmptyOrNil:@"   "];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isStringEmptyOrNil_returns_true_when_nil {
    BOOL result = [NSString mk_isStringEmptyOrNil:nil];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isStringEmptyOrNil_returns_false {
    BOOL result = [NSString mk_isStringEmptyOrNil:@"A B"];
    assertThatBool(result, equalToBool(NO));
}

- (void)test_trimmedString {
    NSString *input = [NSString stringWithFormat:@" ABCD "];
    NSString *result = [input mk_trimmedString];
    assertThat(result, equalTo(@"ABCD"));
}

@end
