//
//  NSMutableArray+MK_Queue.m
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

@interface NSMutableArray_MK_Queue : XCTestCase

@property (nonatomic, strong) NSMutableArray *target;

@end

@implementation NSMutableArray_MK_Queue

- (void)setUp {
    [super setUp];
    self.target = [NSMutableArray arrayWithArray:@[@1, @2, @3]];
}

- (void)tearDown {
    self.target = nil;
    [super tearDown];
}

- (void)test_enqueueObject_adds_element_at_the_end {
    id expected = @5;
    [self.target mk_enqueueObject:expected];
    id result = [self.target lastObject];
    
    assertThat(result, sameInstance(expected));
}

- (void)test_dequeueObject_when_empty_returns_nil {
    self.target = [NSMutableArray array];
    id result = [self.target mk_dequeueObject];
    
    assertThat(result, nilValue());
}

- (void)test_dequeueObject_returns_first_element {
    id expected = [self.target mk_firstObject];
    id result = [self.target mk_dequeueObject];
    
    assertThat(result, sameInstance(expected));
}

- (void)test_dequeueObject_removes_first_element {
    [self.target mk_dequeueObject];
    
    assertThat(self.target, hasCountOf(2));
    assertThat(self.target, contains(@2, @3, nil));
}

@end
