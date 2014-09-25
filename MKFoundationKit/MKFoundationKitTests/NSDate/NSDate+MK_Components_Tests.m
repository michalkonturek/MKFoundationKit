//
//  NSDate+MK_Components_Tests.m
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

@interface NSDate_MK_Components_Tests : XCTestCase

@property (nonatomic, strong) NSDate *target;

@end

@implementation NSDate_MK_Components_Tests

- (void)setUp {
    [super setUp];
    self.target = [NSDate mk_dateFromString:@"07-01-2013 20:02:15" withFormat:@"dd-MM-yyyy HH:mm:ss"];
}

- (void)tearDown {
    self.target = nil;
    [super tearDown];
}

- (void)test_year {
    NSInteger result = [self.target mk_year];
    assertThatInteger(result, equalToInteger(2013));
}

- (void)test_weekOfMonth {
    NSInteger result = [self.target mk_weekOfMonth];
    assertThatInteger(result, equalToInteger(2));
}

- (void)test_weekOfYear {
    NSInteger result = [self.target mk_weekOfYear];
    assertThatInteger(result, equalToInteger(2));
}

- (void)test_weekday {
    NSInteger result = [self.target mk_weekday];
    assertThatInteger(result, equalToInteger(2));
}

- (void)test_nthWeekday {
    NSInteger result = [self.target mk_nthWeekday];
    assertThatInteger(result, equalToInteger(1));
}

- (void)test_day {
    NSInteger result = [self.target mk_day];
    assertThatInteger(result, equalToInteger(7));
}

- (void)test_hour {
    NSInteger result = [self.target mk_hour];
    assertThatInteger(result, equalToInteger(20));
}

- (void)test_minute {
    NSInteger result = [self.target mk_minutes];
    assertThatInteger(result, equalToInteger(2));
}

- (void)test_seconds {
    NSInteger result = [self.target mk_seconds];
    assertThatInteger(result, equalToInteger(15));
}


@end
