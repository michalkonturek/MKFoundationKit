//
//  NSDate+MK_Creation_Tests.m
//  MKFoundation
//
//  Created by Michal Konturek on 24/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import <XCTest/XCTest.h>

#define HC_SHORTHAND
#import <OCHamcrest.h>

#import "BaseTest.h"

@interface NSDate_MK_Creation_Tests : XCTestCase

@end

@implementation NSDate_MK_Creation_Tests

- (void)test_dateTomorrow {
    NSDate *today = [NSDate date];
    NSDate *tomorrow = [NSDate mk_dateTomorrow];
    NSInteger result = [today mk_differenceInDaysToDate:tomorrow];
    assertThatInteger(result, equalToInteger(1));
}

- (void)test_dateYesterday {
    NSDate *today = [NSDate date];
    NSDate *yesterday = [[NSDate mk_dateYesterday] mk_dateWithoutTime];
    NSInteger result = [today mk_differenceInDaysToDate:yesterday];
    assertThatInteger(result, equalToInteger(-1));
}

- (void)test_dateWithoutTime {
    NSDate *date = [NSDate mk_dateWithoutTime];
    id result = [date mk_formattedStringUsingFormat:@"HH:mm"];
    assertThat(result, equalTo(@"00:00"));
}

- (void)test_dateFromStringWithFormat {
    id string = @"2012-04-01";
    id date = [NSDate mk_dateFromString:string withFormat:[NSDate mk_dateFormatYYYYMMDDDashed]];
    
    id result = [date mk_formattedStringUsingFormat:[NSDate mk_dateFormatYYYYMMDDDashed]];
    assertThat(result, equalTo(string));
}

@end
