//
//  NSDate+MK_Comparison_Tests.m
//  MKFoundation
//
//  Created by Michal Konturek on 08/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "BaseTest.h"

@interface NSDate_MK_Comparison_Tests : SenTestCase

@end

@implementation NSDate_MK_Comparison_Tests

- (void)test_isToday_returns_true {
    NSDate *target = [NSDate date];
    BOOL result = [target MK_isToday];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isToday_returns_false {
    NSDate *target = [NSDate MK_dateTomorrow];
    BOOL result = [target MK_isToday];
    assertThatBool(result, equalToBool(NO));
}

- (void)test_isTomorrow_returns_true {
    NSDate *target = [NSDate MK_dateTomorrow];
    BOOL result = [target MK_isTomorrow];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isTomorrow_returns_false {
    NSDate *target = [NSDate date];
    BOOL result = [target MK_isTomorrow];
    assertThatBool(result, equalToBool(NO));
}

- (void)test_isYesterday_returns_true {
    NSDate *target = [NSDate MK_dateYesterday];
    BOOL result = [target MK_isYesterday];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isYesterday_returns_false {
    NSDate *target = [NSDate date];
    BOOL result = [target MK_isYesterday];
    assertThatBool(result, equalToBool(NO));
}

- (void)test_isThisWeek_returns_true {
    NSDate *target = [NSDate date];
    BOOL result = [target MK_isThisWeek];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isThisWeek_returns_false {
    NSDate *target = [[NSDate date] MK_dateByAddingDays:8];
    BOOL result = [target MK_isThisWeek];
    assertThatBool(result, equalToBool(NO));
}

- (void)test_isNextWeek_returns_true {
    NSDate *target = [[NSDate date] MK_dateByAddingDays:7];
    BOOL result = [target MK_isNextWeek];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isNextWeek_returns_false {
    NSDate *target = [NSDate date];
    BOOL result = [target MK_isNextWeek];
    assertThatBool(result, equalToBool(NO));
}

- (void)test_isLastWeek_returns_true {
    NSDate *target = [[NSDate date] MK_dateBySubtractingWeeks:1];
    BOOL result = [target MK_isLastWeek];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isLastWeek_returns_false {
    NSDate *target = [NSDate date];
    BOOL result = [target MK_isLastWeek];
    assertThatBool(result, equalToBool(NO));
}

- (void)test_isSameWeekAsDate_returns_true {
    NSDate *target = [NSDate MK_dateFromString:@"01-01-2013"];
    BOOL result = [target MK_isSameWeekAsDate:[NSDate MK_dateFromString:@"02-01-2013"]];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isSameWeekAsDate_returns_true_when_different_months {
    NSDate *target = [NSDate MK_dateFromString:@"31-01-2013"];
    BOOL result = [target MK_isSameWeekAsDate:[NSDate MK_dateFromString:@"02-02-2013"]];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isSameWeekAsDate_returns_false {
    NSDate *target = [NSDate date];
    BOOL result = [target MK_isSameWeekAsDate:[target MK_dateByAddingWeeks:1]];
    assertThatBool(result, equalToBool(NO));
}

- (void)test_isSameWeekAsDate_returns_false_when_different_year {
    NSDate *target = [NSDate MK_dateFromString:@"01-01-2013"];
    BOOL result = [target MK_isSameWeekAsDate:[target MK_dateByAddingYears:1]];
    assertThatBool(result, equalToBool(NO));
}

- (void)test_isThisYear_returns_true {
    NSDate *target = [NSDate date];
    BOOL result = [target MK_isThisYear];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isThisYear_returns_false {
    NSDate *target = [[NSDate date] MK_dateByAddingYears:1];
    BOOL result = [target MK_isThisYear];
    assertThatBool(result, equalToBool(NO));
}

- (void)test_isNextYear_returns_true {
    NSDate *target = [[NSDate date] MK_dateByAddingYears:1];
    BOOL result = [target MK_isNextYear];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isNextYear_returns_false {
    NSDate *target = [NSDate date];
    BOOL result = [target MK_isNextYear];
    assertThatBool(result, equalToBool(NO));
}

- (void)test_isLastYear_returns_true {
    NSDate *target = [[NSDate date] MK_dateBySubtractingYears:1];
    BOOL result = [target MK_isLastYear];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isLastYear_returns_false {
    NSDate *target = [NSDate date];
    BOOL result = [target MK_isLastYear];
    assertThatBool(result, equalToBool(NO));
}

- (void)test_isEarlierThanDate_returns_true {
    NSDate *target = [NSDate date];
    NSDate *other = [[NSDate date] MK_dateByAddingDays:1];
    BOOL result = [target MK_isEarlierThanDate:other];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isEarlierThanDate_returns_false {
    NSDate *target = [NSDate date];
    NSDate *other = [[NSDate date] MK_dateBySubtractingDays:1];
    BOOL result = [target MK_isEarlierThanDate:other];
    assertThatBool(result, equalToBool(NO));
}

- (void)test_isLaterThanDate_returns_true {
    NSDate *target = [NSDate date];
    NSDate *other = [[NSDate date] MK_dateBySubtractingDays:1];
    BOOL result = [target MK_isLaterThanDate:other];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isLaterThanDate_returns_false {
    NSDate *target = [NSDate date];
    NSDate *other = [[NSDate date] MK_dateByAddingDays:1];
    BOOL result = [target MK_isLaterThanDate:other];
    assertThatBool(result, equalToBool(NO));
}

- (void)test_isEqualToDateIgnoringTime_returns_true {
    
}

- (void)test_isEqualToDateIgnoringTime_returns_false {
    
}

@end
