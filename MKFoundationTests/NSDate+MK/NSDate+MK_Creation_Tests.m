//
//  NSDate+MK_Creation_Tests.m
//  MKFoundation
//
//  Created by Michal Konturek on 24/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "BaseTest.h"

@interface NSDate_MK_Creation_Tests : SenTestCase

@end

@implementation NSDate_MK_Creation_Tests

- (void)test_dateTomorrow {
    NSDate *today = [NSDate date];
    NSDate *tomorrow = [NSDate MK_dateTomorrow];
    NSInteger result = [today MK_differenceInDaysToDate:tomorrow];
    assertThatInteger(result, equalToInteger(1));
}

- (void)test_dateYesterday {
    NSDate *today = [NSDate date];
    NSDate *yesterday = [[NSDate MK_dateYesterday] MK_dateWithoutTime];
    NSInteger result = [today MK_differenceInDaysToDate:yesterday];
    assertThatInteger(result, equalToInteger(-1));
}

- (void)test_dateWithoutTime {
    NSDate *date = [NSDate MK_dateWithoutTime];
    id result = [date MK_formattedStringUsingFormat:@"HH:mm"];
    assertThat(result, equalTo(@"00:00"));
}

- (void)test_dateFromStringWithFormat {
    id string = @"2012-04-01";
    id date = [NSDate MK_dateFromString:string withFormat:[NSDate MK_dateFormatYYYYMMDDDashed]];
    
    id result = [date MK_formattedStringUsingFormat:[NSDate MK_dateFormatYYYYMMDDDashed]];
    assertThat(result, equalTo(string));
}

@end
