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

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)test_dateWithoutTime {
    NSDate *date = [NSDate dateWithoutTime];
    id result = [date formattedStringUsingFormat:@"HH:mm"];
    assertThat(result, equalTo(@"00:00"));
}

- (void)test_dateFromStringWithFormat {
    id string = @"2012-04-01";
    id date = [NSDate dateFromString:string withFormat:[NSDate dateFormatYYYYMMDDDashed]];
    
    id result = [date formattedStringUsingFormat:[NSDate dateFormatYYYYMMDDDashed]];
    assertThat(result, equalTo(string));
}

@end
