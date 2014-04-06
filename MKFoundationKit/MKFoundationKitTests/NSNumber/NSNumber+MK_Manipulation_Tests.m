//
//  NSNumber+MK_Manipulation_Tests.m
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

@interface NSNumber_MK_Manipulation_Tests : XCTestCase

@property (nonatomic, strong) NSNumber *input;

@end

@implementation NSNumber_MK_Manipulation_Tests

- (void)setUp {
    [super setUp];
    self.input = @2;
}

- (void)tearDown {
    self.input = nil;
    [super tearDown];
}

- (void)test_add_integer {
    id result = [self.input mk_add:@2];
    assertThat(result, equalToInteger(4));
}

- (void)test_add_fraction {
    id result = [self.input mk_add:@2.6];
    assertThat(result, equalToDouble(4.6));
}

- (void)test_subtract_integer {
    id result = [self.input mk_subtract:@1];
    assertThat(result, equalToInteger(1));
}

- (void)test_subtract_fraction {
    id result = [self.input mk_subtract:@1.2];
    assertThat(result, equalToDouble(0.8));
}

- (void)test_multiplyBy {
    id result = [self.input mk_multiplyBy:@2];
    assertThat(result, equalToInteger(4));
}

- (void)test_divideBy {
    id result = [self.input mk_divideBy:@4];
    assertThat(result, equalToDouble(0.5));
}

- (void)test_raiseToPower_positive {
    id result = [self.input mk_raiseToPower:3];
    assertThat(result, equalToInteger(8));
}

- (void)test_raiseToPower_negative {
    id result = [self.input mk_raiseToPower:-3];
    assertThat(result, equalToDouble(0.125));
}

@end
