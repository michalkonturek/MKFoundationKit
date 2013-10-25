//
//  NSDate+MK_Formatting_Tests.m
//  MKFoundation
//
//  Created by Michal Konturek on 24/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "BaseTest.h"

@interface NSDate_MK_Formatting_Tests : SenTestCase

@end

@implementation NSDate_MK_Formatting_Tests

- (void)test_formattedString {
    id string = @"2012-04-01";
    id date = [NSDate MK_dateFromString:string withFormat:[NSDate MK_dateFormatYYYYMMDDDashed]];
    
    id result = [date MK_formattedStringUsingFormat:[NSDate MK_dateFormatYYYYMMDDDashed]];
    assertThat(result, equalTo(string));
}

@end
