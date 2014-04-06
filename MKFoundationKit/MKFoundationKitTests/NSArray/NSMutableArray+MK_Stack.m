//
//  NSMutableArray+MK_Stack.m
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

@interface NSMutableArray_MK_Stack : XCTestCase

@property (nonatomic, strong) NSMutableArray *target;

@end

@implementation NSMutableArray_MK_Stack

- (void)setUp {
    [super setUp];
    self.target = [NSMutableArray arrayWithArray:@[@1, @2, @3]];
}

- (void)tearDown {
    self.target = nil;
    [super tearDown];
}

- (void)test_pushObject {
    id expected = @0;;
    [self.target mk_pushObject:expected];
    id result = [self.target objectAtIndex:0];
    assertThat(result, sameInstance(expected));
}

- (void)test_pullObject {
    id expected = [self.target objectAtIndex:0];
    id result = [self.target mk_pullObject];
    assertThat(result, sameInstance(expected));
}

@end
