//
//  NSObject+MK_Misc_Tests.m
//  MKFoundationKit
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

@interface NSObject_MK_Misc_Tests : XCTestCase

@end

@implementation NSObject_MK_Misc_Tests

- (void)test_exists_returns_true {
    id target = @1;
    assertThatBool([target mk_exists], isTrue());
}

- (void)test_exists_returns_false_when_nil {
    id target = nil;
    assertThatBool([target mk_exists], isFalse());
}

- (void)test_exists_returns_false_when_nsnull {
    id target = [NSNull null];
    assertThatBool([target mk_exists], isFalse());
}

@end
