//
//  NSArray+MK_Misc_Tests.m
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

@interface NSArray_MK_Misc_Tests : XCTestCase

@property (nonatomic, strong) NSArray *target;

@end

@implementation NSArray_MK_Misc_Tests

- (void)setUp {
    [super setUp];
    self.target = @[@1, @2, @3];
}

- (void)tearDown {
    self.target = nil;
    [super tearDown];
}

- (void)test_firstObject_returns_first_element {
    id expected = [self.target objectAtIndex:0];
    id result = [self.target mk_firstObject];
    
    assertThat(result, sameInstance(expected));
}

- (void)test_isEmpty_returns_true {
    BOOL result = [[NSArray array] mk_isEmpty];
    assertThatBool(result, isTrue());
}

- (void)test_isEmpty_returns_false {
    BOOL result = [self.target mk_isEmpty];
    assertThatBool(result, isFalse());
}

- (void)test_firstObject_when_empty_returns_nil {
    self.target = [NSArray array];
    id result = [self.target mk_firstObject];
    
    assertThat(result, nilValue());
}

- (void)test_max {
    NSNumber *result = [self.target mk_max];
    assertThat(result, equalToInteger(3));
}

- (void)test_max_returns_zero_when_empty {
    NSNumber *result = [[NSArray array] mk_max];
    assertThat(result, equalToInteger(0));
}

- (void)test_min {
    NSNumber *result = [self.target mk_min];
    assertThat(result, equalToInteger(1));
}

- (void)test_min_returns_zero_when_empty {
    NSNumber *result = [[NSArray array] mk_min];
    assertThat(result, equalToInteger(0));
}

- (void)test_reverse {
    id result = [self.target mk_reverse];
    assertThat(result, contains(@3, @2, @1, nil));
}

@end
