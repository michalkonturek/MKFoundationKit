//
//  NSDate+MK_Manipulation_Tests.m
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

@interface NSDate_MK_Manipulation_Tests : XCTestCase

@property (nonatomic, strong) NSDate *input;

@end

@implementation NSDate_MK_Manipulation_Tests

- (void)setUp {
    [super setUp];
    self.input = [NSDate mk_dateFromString:@"01-04-2012"];
}

- (void)tearDown {
    self.input = nil;
    [super tearDown];
}

- (void)test_dateByAddingDays {
    id date = [self.input mk_dateByAddingDays:10];
    id result = [date mk_formattedString];
    assertThat(result, equalTo(@"11-04-2012"));
}

- (void)test_dateByAddingWeeks {
    id date = [self.input mk_dateByAddingWeeks:2];
    id result = [date mk_formattedString];
    assertThat(result, equalTo(@"15-04-2012"));
}

- (void)test_dateByAddingMonths {
    id date = [self.input mk_dateByAddingMonths:2];
    id result = [date mk_formattedString];
    assertThat(result, equalTo(@"01-06-2012"));
}

- (void)test_dateByAddingYears {
    id date = [self.input mk_dateByAddingYears:1];
    id result = [date mk_formattedString];
    assertThat(result, equalTo(@"01-04-2013"));
}

- (void)test_dateByAddingHours {
    NSInteger element = 8;
    id date = [[self.input mk_dateWithoutTime] mk_dateByAddingHours:element];
    NSInteger result = [date mk_hour];
    assertThatInteger(result, equalToInteger(element));
}

- (void)test_dateByAddingMinutes {
    NSInteger element = 38;
    id date = [[self.input mk_dateWithoutTime] mk_dateByAddingMinutes:element];
    NSInteger result = [date mk_minutes];
    assertThatInteger(result, equalToInteger(element));
}

- (void)test_dateByAddingSeconds {
    NSInteger element = 42;
    id date = [[self.input mk_dateWithoutTime] mk_dateByAddingSeconds:element];
    NSInteger result = [date mk_seconds];
    assertThatInteger(result, equalToInteger(element));
}

- (void)test_dateBySubtractingDays {
    id date = [self.input mk_dateBySubtractingDays:10];
    id result = [date mk_formattedString];
    assertThat(result, equalTo(@"22-03-2012"));
}

- (void)test_dateBySubtractingWeeks {
    id date = [self.input mk_dateBySubtractingWeeks:2];
    id result = [date mk_formattedString];
    assertThat(result, equalTo(@"18-03-2012"));
}

- (void)test_dateBySubtractingMonths {
    id date = [self.input mk_dateBySubtractingMonths:2];
    id result = [date mk_formattedString];
    assertThat(result, equalTo(@"01-02-2012"));
}

- (void)test_dateBySubtractingYears {
    id date = [self.input mk_dateBySubtractingYears:2];
    id result = [date mk_formattedString];
    assertThat(result, equalTo(@"01-04-2010"));
}

- (void)test_dateBySubtractingHours {
    NSInteger plus = 8;
    NSInteger minus = 2;
    id date = [[self.input mk_dateWithoutTime] mk_dateByAddingHours:plus];
    NSInteger result = [[date mk_dateBySubtractingHours:minus] mk_hour];
    assertThatInteger(result, equalToInteger(plus - minus));
}

- (void)test_dateBySubtractingMinutes {
    NSInteger plus = 38;
    NSInteger minus = 18;
    id date = [[self.input mk_dateWithoutTime] mk_dateByAddingMinutes:plus];
    NSInteger result = [[date mk_dateBySubtractingMinutes:minus] mk_minutes];
    assertThatInteger(result, equalToInteger(plus - minus));
}

- (void)test_dateBySubtractingSeconds {
    NSInteger plus = 42;
    NSInteger minus = 19;
    id date = [[self.input mk_dateWithoutTime] mk_dateByAddingSeconds:plus];
    NSInteger result = [[date mk_dateBySubtractingSeconds:minus] mk_seconds];
    assertThatInteger(result, equalToInteger(plus - minus));
}

- (void)test_differenceInDaysToDate_when_later_date {
    id date = [NSDate mk_dateFromString:@"11-04-2012"];
    NSInteger result = [self.input mk_differenceInDaysToDate:date];
    assertThatInteger(result, equalToInteger(10));
}

- (void)test_differenceInDaysToDate_when_earlier_date {
    id date = [NSDate mk_dateFromString:@"11-04-2012"];
    NSInteger result = [date mk_differenceInDaysToDate:self.input];
    assertThatInteger(result, equalToInteger(-10));
}

- (void)test_differenceInMonthsToDate_when_later_date {
    id date = [NSDate mk_dateFromString:@"01-06-2012"];
    NSInteger result = [self.input mk_differenceInMonthsToDate:date];
    assertThatInteger(result, equalToInteger(2));
}

- (void)test_differenceInMonthsToDate_when_earlier_date {
    id date = [NSDate mk_dateFromString:@"01-06-2012"];
    NSInteger result = [date mk_differenceInMonthsToDate:self.input];
    assertThatInteger(result, equalToInteger(-2));
}

- (void)test_differenceInYearsToDate_when_later_date {
    id date = [NSDate mk_dateFromString:@"01-04-2013"];
    NSInteger result = [self.input mk_differenceInYearsToDate:date];
    assertThatInteger(result, equalToInteger(1));
}

- (void)test_differenceInYearsToDate_when_earlier_date {
    id date = [NSDate mk_dateFromString:@"01-04-2013"];
    NSInteger result = [date mk_differenceInYearsToDate:self.input];
    assertThatInteger(result, equalToInteger(-1));
}

- (void)test_differenceInHoursToDate_when_later_date {
    id target = [NSDate mk_dateFromString:@"01-04-2014 13:00" withFormat:@"dd-MM-yyyy HH:mm"];
    id input = [target mk_dateByAddingHours:1];
    
    NSInteger result = [target mk_differenceInHoursToDate:input];
    assertThatInteger(result, equalToInteger(1));
}

- (void)test_differenceInHoursToDate_when_earlier_date {
    id target = [NSDate mk_dateFromString:@"01-04-2014 13:00" withFormat:@"dd-MM-yyyy HH:mm"];
    id input = [target mk_dateByAddingHours:1];
    
    NSInteger result = [input mk_differenceInHoursToDate:target];
    assertThatInteger(result, equalToInteger(-1));
}

- (void)test_differenceInMinuteToDate_when_later_date {
    id target = [NSDate mk_dateFromString:@"01-04-2014 13:00" withFormat:@"dd-MM-yyyy HH:mm"];
    id input = [target mk_dateByAddingMinutes:1];
    
    NSInteger result = [target mk_differenceInMinutesToDate:input];
    assertThatInteger(result, equalToInteger(1));
}

- (void)test_differenceInMinuteToDate_when_earlier_date {
    id target = [NSDate mk_dateFromString:@"01-04-2014 13:00" withFormat:@"dd-MM-yyyy HH:mm"];
    id input = [target mk_dateByAddingMinutes:1];
    
    NSInteger result = [input mk_differenceInMinutesToDate:target];
    assertThatInteger(result, equalToInteger(-1));
}

- (void)test_differenceInSecondToDate_when_later_date {
    id target = [NSDate mk_dateFromString:@"01-04-2014 13:00:00" withFormat:@"dd-MM-yyyy HH:mm:ss"];
    id input = [target mk_dateByAddingMinutes:1];
    
    NSInteger result = [target mk_differenceInSecondsToDate:input];
    assertThatInteger(result, equalToInteger(60));
}

- (void)test_differenceInSecondToDate_when_earlier_date {
    id target = [NSDate mk_dateFromString:@"01-04-2014 13:00:00" withFormat:@"dd-MM-yyyy HH:mm:ss"];
    id input = [target mk_dateByAddingMinutes:1];
    
    NSInteger result = [input mk_differenceInSecondsToDate:target];
    assertThatInteger(result, equalToInteger(-60));
}

@end
