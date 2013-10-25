//
//  NSDate+MK_Manipulation_Tests.m
//  MKFoundation
//
//  Created by Michal Konturek on 24/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "BaseTest.h"

@interface NSDate_MK_Manipulation_Tests : SenTestCase

@property (nonatomic, strong) NSDate *input;

@end

@implementation NSDate_MK_Manipulation_Tests

- (void)setUp {
    [super setUp];
    self.input = [NSDate MK_dateFromString:@"01-04-2012"];
}

- (void)tearDown {
    self.input = nil;
    [super tearDown];
}

- (void)test_dateByAddingDays {
    id date = [self.input dateByAddingDays:10];
    id result = [date MK_formattedString];
    assertThat(result, equalTo(@"11-04-2012"));
}

- (void)test_dateByAddingWeeks {
    id date = [self.input dateByAddingWeeks:2];
    id result = [date MK_formattedString];
    assertThat(result, equalTo(@"15-04-2012"));
}

- (void)test_dateByAddingMonths {
    id date = [self.input dateByAddingMonths:2];
    id result = [date MK_formattedString];
    assertThat(result, equalTo(@"01-06-2012"));
}

- (void)test_dateByAddingYears {
    id date = [self.input dateByAddingYears:1];
    id result = [date MK_formattedString];
    assertThat(result, equalTo(@"01-04-2013"));
}

- (void)test_dateBySubtractingDays {
    id date = [self.input dateBySubtractingDays:10];
    id result = [date MK_formattedString];
    assertThat(result, equalTo(@"22-03-2012"));
}

- (void)test_dateBySubtractingWeeks {
    id date = [self.input dateBySubtractingWeeks:2];
    id result = [date MK_formattedString];
    assertThat(result, equalTo(@"18-03-2012"));
}

- (void)test_dateBySubtractingMonths {
    id date = [self.input dateBySubtractingMonths:2];
    id result = [date MK_formattedString];
    assertThat(result, equalTo(@"01-02-2012"));
}

- (void)test_dateBySubtractingYears {
    id date = [self.input dateBySubtractingYears:2];
    id result = [date MK_formattedString];
    assertThat(result, equalTo(@"01-04-2010"));
}

- (void)test_differenceInDaysToDate_when_later_date {
    id date = [NSDate MK_dateFromString:@"11-04-2012"];
    NSInteger result = [self.input differenceInDaysToDate:date];
    assertThatInteger(result, equalToInteger(10));
}

- (void)test_differenceInDaysToDate_when_earlier_date {
    id date = [NSDate MK_dateFromString:@"11-04-2012"];
    NSInteger result = [date differenceInDaysToDate:self.input];
    assertThatInteger(result, equalToInteger(-10));
}

- (void)test_differenceInMonthsToDate_when_later_date {
    id date = [NSDate MK_dateFromString:@"01-06-2012"];
    NSInteger result = [self.input differenceInMonthsToDate:date];
    assertThatInteger(result, equalToInteger(2));
}

- (void)test_differenceInMonthsToDate_when_earlier_date {
    id date = [NSDate MK_dateFromString:@"01-06-2012"];
    NSInteger result = [date differenceInMonthsToDate:self.input];
    assertThatInteger(result, equalToInteger(-2));
}

- (void)test_differenceInYearsToDate_when_later_date {
    id date = [NSDate MK_dateFromString:@"01-04-2013"];
    NSInteger result = [self.input differenceInYearsToDate:date];
    assertThatInteger(result, equalToInteger(1));
}

- (void)test_differenceInYearsToDate_when_earlier_date {
    id date = [NSDate MK_dateFromString:@"01-04-2013"];
    NSInteger result = [date differenceInYearsToDate:self.input];
    assertThatInteger(result, equalToInteger(-1));
}

@end
