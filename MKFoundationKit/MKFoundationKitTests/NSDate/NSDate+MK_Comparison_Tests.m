//
//  NSDate+MK_Comparison_Tests.m
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

@interface NSDate_MK_Comparison_Tests : XCTestCase

@end

@implementation NSDate_MK_Comparison_Tests

- (void)test_isToday_returns_true {
    NSDate *target = [NSDate date];
    BOOL result = [target mk_isToday];
    assertThatBool(result, isTrue());
}

- (void)test_isToday_returns_false {
    NSDate *target = [NSDate mk_dateTomorrow];
    BOOL result = [target mk_isToday];
    assertThatBool(result, isFalse());
}

- (void)test_isTomorrow_returns_true {
    NSDate *target = [NSDate mk_dateTomorrow];
    BOOL result = [target mk_isTomorrow];
    assertThatBool(result, isTrue());
}

- (void)test_isTomorrow_returns_false {
    NSDate *target = [NSDate date];
    BOOL result = [target mk_isTomorrow];
    assertThatBool(result, isFalse());
}

- (void)test_isYesterday_returns_true {
    NSDate *target = [NSDate mk_dateYesterday];
    BOOL result = [target mk_isYesterday];
    assertThatBool(result, isTrue());
}

- (void)test_isYesterday_returns_false {
    NSDate *target = [NSDate date];
    BOOL result = [target mk_isYesterday];
    assertThatBool(result, isFalse());
}

- (void)test_isThisWeek_returns_true {
    NSDate *target = [NSDate date];
    BOOL result = [target mk_isThisWeek];
    assertThatBool(result, isTrue());
}

- (void)test_isThisWeek_returns_false {
    NSDate *target = [[NSDate date] mk_dateByAddingDays:8];
    BOOL result = [target mk_isThisWeek];
    assertThatBool(result, isFalse());
}

- (void)test_isNextWeek_returns_true {
    NSDate *target = [[NSDate date] mk_dateByAddingDays:7];
    BOOL result = [target mk_isNextWeek];
    assertThatBool(result, isTrue());
}

- (void)test_isNextWeek_returns_false {
    NSDate *target = [NSDate date];
    BOOL result = [target mk_isNextWeek];
    assertThatBool(result, isFalse());
}

- (void)test_isLastWeek_returns_true {
    NSDate *target = [[NSDate date] mk_dateBySubtractingWeeks:1];
    BOOL result = [target mk_isLastWeek];
    assertThatBool(result, isTrue());
}

- (void)test_isLastWeek_returns_false {
    NSDate *target = [NSDate date];
    BOOL result = [target mk_isLastWeek];
    assertThatBool(result, isFalse());
}

- (void)test_isSameWeekAsDate_returns_true {
    NSDate *target = [NSDate mk_dateFromString:@"01-01-2013"];
    BOOL result = [target mk_isSameWeekAsDate:[NSDate mk_dateFromString:@"02-01-2013"]];
    assertThatBool(result, isTrue());
}

- (void)test_isSameWeekAsDate_returns_true_when_different_months {
    NSDate *target = [NSDate mk_dateFromString:@"31-01-2013"];
    BOOL result = [target mk_isSameWeekAsDate:[NSDate mk_dateFromString:@"02-02-2013"]];
    assertThatBool(result, isTrue());
}

- (void)test_isSameWeekAsDate_returns_false {
    NSDate *target = [NSDate date];
    BOOL result = [target mk_isSameWeekAsDate:[target mk_dateByAddingWeeks:1]];
    assertThatBool(result, isFalse());
}

- (void)test_isSameWeekAsDate_returns_false_when_different_year {
    NSDate *target = [NSDate mk_dateFromString:@"01-01-2013"];
    BOOL result = [target mk_isSameWeekAsDate:[target mk_dateByAddingYears:1]];
    assertThatBool(result, isFalse());
}

- (void)test_isThisYear_returns_true {
    NSDate *target = [NSDate date];
    BOOL result = [target mk_isThisYear];
    assertThatBool(result, isTrue());
}

- (void)test_isThisYear_returns_false {
    NSDate *target = [[NSDate date] mk_dateByAddingYears:1];
    BOOL result = [target mk_isThisYear];
    assertThatBool(result, isFalse());
}

- (void)test_isNextYear_returns_true {
    NSDate *target = [[NSDate date] mk_dateByAddingYears:1];
    BOOL result = [target mk_isNextYear];
    assertThatBool(result, isTrue());
}

- (void)test_isNextYear_returns_false {
    NSDate *target = [NSDate date];
    BOOL result = [target mk_isNextYear];
    assertThatBool(result, isFalse());
}

- (void)test_isLastYear_returns_true {
    NSDate *target = [[NSDate date] mk_dateBySubtractingYears:1];
    BOOL result = [target mk_isLastYear];
    assertThatBool(result, isTrue());
}

- (void)test_isLastYear_returns_false {
    NSDate *target = [NSDate date];
    BOOL result = [target mk_isLastYear];
    assertThatBool(result, isFalse());
}

- (void)test_isEarlierThanDate_returns_true {
    NSDate *target = [NSDate date];
    NSDate *other = [[NSDate date] mk_dateByAddingDays:1];
    BOOL result = [target mk_isEarlierThanDate:other];
    assertThatBool(result, isTrue());
}

- (void)test_isEarlierThanDate_returns_false {
    NSDate *target = [NSDate date];
    NSDate *other = [[NSDate date] mk_dateBySubtractingDays:1];
    BOOL result = [target mk_isEarlierThanDate:other];
    assertThatBool(result, isFalse());
}

- (void)test_isLaterThanDate_returns_true {
    NSDate *target = [NSDate date];
    NSDate *other = [[NSDate date] mk_dateBySubtractingDays:1];
    BOOL result = [target mk_isLaterThanDate:other];
    assertThatBool(result, isTrue());
}

- (void)test_isLaterThanDate_returns_false {
    NSDate *target = [NSDate date];
    NSDate *other = [[NSDate date] mk_dateByAddingDays:1];
    BOOL result = [target mk_isLaterThanDate:other];
    assertThatBool(result, isFalse());
}

- (void)test_isEqualToDateIgnoringTime_returns_true {
    NSString *format = @"dd-MM-yyyy HH:mm:ss";
    id target = [NSDate mk_dateFromString:@"07-01-2013 20:02:15" withFormat:format];
    id other = [target mk_dateByAddingHours:1];

    BOOL result = [target mk_isEqualToDateIgnoringTime:other];
    assertThatBool(result, isTrue());
}

- (void)test_isEqualToDateIgnoringTime_returns_false {
    NSString *format = @"dd-MM-yyyy HH:mm:ss";
    id target = [NSDate mk_dateFromString:@"07-01-2013 20:02:15" withFormat:format];
    id other = [target mk_dateByAddingHours:6];
    
    BOOL result = [target mk_isEqualToDateIgnoringTime:other];
    assertThatBool(result, isFalse());
}

@end
