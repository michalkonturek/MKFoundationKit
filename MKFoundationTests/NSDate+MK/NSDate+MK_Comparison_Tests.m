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
    BOOL result = [target mk_isToday];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isToday_returns_false {
    NSDate *target = [NSDate mk_dateTomorrow];
    BOOL result = [target mk_isToday];
    assertThatBool(result, equalToBool(NO));
}

- (void)test_isTomorrow_returns_true {
    NSDate *target = [NSDate mk_dateTomorrow];
    BOOL result = [target mk_isTomorrow];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isTomorrow_returns_false {
    NSDate *target = [NSDate date];
    BOOL result = [target mk_isTomorrow];
    assertThatBool(result, equalToBool(NO));
}

- (void)test_isYesterday_returns_true {
    NSDate *target = [NSDate mk_dateYesterday];
    BOOL result = [target mk_isYesterday];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isYesterday_returns_false {
    NSDate *target = [NSDate date];
    BOOL result = [target mk_isYesterday];
    assertThatBool(result, equalToBool(NO));
}

- (void)test_isThisWeek_returns_true {
    NSDate *target = [NSDate date];
    BOOL result = [target mk_isThisWeek];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isThisWeek_returns_false {
    NSDate *target = [[NSDate date] mk_dateByAddingDays:8];
    BOOL result = [target mk_isThisWeek];
    assertThatBool(result, equalToBool(NO));
}

- (void)test_isNextWeek_returns_true {
    NSDate *target = [[NSDate date] mk_dateByAddingDays:7];
    BOOL result = [target mk_isNextWeek];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isNextWeek_returns_false {
    NSDate *target = [NSDate date];
    BOOL result = [target mk_isNextWeek];
    assertThatBool(result, equalToBool(NO));
}

- (void)test_isLastWeek_returns_true {
    NSDate *target = [[NSDate date] mk_dateBySubtractingWeeks:1];
    BOOL result = [target mk_isLastWeek];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isLastWeek_returns_false {
    NSDate *target = [NSDate date];
    BOOL result = [target mk_isLastWeek];
    assertThatBool(result, equalToBool(NO));
}

- (void)test_isSameWeekAsDate_returns_true {
    NSDate *target = [NSDate mk_dateFromString:@"01-01-2013"];
    BOOL result = [target mk_isSameWeekAsDate:[NSDate mk_dateFromString:@"02-01-2013"]];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isSameWeekAsDate_returns_true_when_different_months {
    NSDate *target = [NSDate mk_dateFromString:@"31-01-2013"];
    BOOL result = [target mk_isSameWeekAsDate:[NSDate mk_dateFromString:@"02-02-2013"]];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isSameWeekAsDate_returns_false {
    NSDate *target = [NSDate date];
    BOOL result = [target mk_isSameWeekAsDate:[target mk_dateByAddingWeeks:1]];
    assertThatBool(result, equalToBool(NO));
}

- (void)test_isSameWeekAsDate_returns_false_when_different_year {
    NSDate *target = [NSDate mk_dateFromString:@"01-01-2013"];
    BOOL result = [target mk_isSameWeekAsDate:[target mk_dateByAddingYears:1]];
    assertThatBool(result, equalToBool(NO));
}

- (void)test_isThisYear_returns_true {
    NSDate *target = [NSDate date];
    BOOL result = [target mk_isThisYear];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isThisYear_returns_false {
    NSDate *target = [[NSDate date] mk_dateByAddingYears:1];
    BOOL result = [target mk_isThisYear];
    assertThatBool(result, equalToBool(NO));
}

- (void)test_isNextYear_returns_true {
    NSDate *target = [[NSDate date] mk_dateByAddingYears:1];
    BOOL result = [target mk_isNextYear];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isNextYear_returns_false {
    NSDate *target = [NSDate date];
    BOOL result = [target mk_isNextYear];
    assertThatBool(result, equalToBool(NO));
}

- (void)test_isLastYear_returns_true {
    NSDate *target = [[NSDate date] mk_dateBySubtractingYears:1];
    BOOL result = [target mk_isLastYear];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isLastYear_returns_false {
    NSDate *target = [NSDate date];
    BOOL result = [target mk_isLastYear];
    assertThatBool(result, equalToBool(NO));
}

- (void)test_isEarlierThanDate_returns_true {
    NSDate *target = [NSDate date];
    NSDate *other = [[NSDate date] mk_dateByAddingDays:1];
    BOOL result = [target mk_isEarlierThanDate:other];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isEarlierThanDate_returns_false {
    NSDate *target = [NSDate date];
    NSDate *other = [[NSDate date] mk_dateBySubtractingDays:1];
    BOOL result = [target mk_isEarlierThanDate:other];
    assertThatBool(result, equalToBool(NO));
}

- (void)test_isLaterThanDate_returns_true {
    NSDate *target = [NSDate date];
    NSDate *other = [[NSDate date] mk_dateBySubtractingDays:1];
    BOOL result = [target mk_isLaterThanDate:other];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isLaterThanDate_returns_false {
    NSDate *target = [NSDate date];
    NSDate *other = [[NSDate date] mk_dateByAddingDays:1];
    BOOL result = [target mk_isLaterThanDate:other];
    assertThatBool(result, equalToBool(NO));
}

- (void)test_isEqualToDateIgnoringTime_returns_true {
    NSString *format = @"dd-MM-yyyy HH:mm:ss";
    id target = [NSDate mk_dateFromString:@"07-01-2013 20:02:15" withFormat:format];
    id other = [target mk_dateByAddingHours:1];

    BOOL result = [target mk_isEqualToDateIgnoringTime:other];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isEqualToDateIgnoringTime_returns_false {
    NSString *format = @"dd-MM-yyyy HH:mm:ss";
    id target = [NSDate mk_dateFromString:@"07-01-2013 20:02:15" withFormat:format];
    id other = [target mk_dateByAddingHours:6];
    
    BOOL result = [target mk_isEqualToDateIgnoringTime:other];
    assertThatBool(result, equalToBool(NO));
}

@end
