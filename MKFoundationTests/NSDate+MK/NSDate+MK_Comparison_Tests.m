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

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

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
    
}

- (void)test_isThisWeek_returns_false {
    
}

- (void)test_isNextWeek_returns_true {
    
}

- (void)test_isNextWeek_returns_false {
    
}

- (void)test_isLastWeek_returns_true {
    
}

- (void)test_isLastWeek_returns_false {
    
}

- (void)test_isSameWeekAsDate_returns_true {
    
}

- (void)test_isSameWeekAsDate_returns_false {
    
}

- (void)test_isThisYear_returns_true {
    
}

- (void)test_isThisYear_returns_false {
    
}

- (void)test_isNextYear_returns_true {
    
}

- (void)test_isNextYear_returns_false {
    
}

- (void)test_isLastYear_returns_true {
    
}

- (void)test_isLastYear_returns_false {
    
}

- (void)test_isSameYearAsDate_returns_true {
    
}

- (void)test_isSameYearAsDate_returns_false {
    
}

- (void)test_isEarlierThanDate_returns_true {
    
}

- (void)test_isEarlierThanDate_returns_false {
    
}

- (void)test_isLaterThanDate_returns_true {
    
}

- (void)test_isLaterThanDate_returns_false {
    
}

- (void)test_isEqualToDateIgnoringTime_returns_true {
    
}

- (void)test_isEqualToDateIgnoringTime_returns_false {
    
}

@end
