//
//  NSDate+MK_Formatting_Tests.m
//  MKFoundation
//
//  Created by Michal Konturek on 24/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import <XCTest/XCTest.h>

#define HC_SHORTHAND
#import <OCHamcrest.h>

#import "BaseTest.h"

@interface NSDate_MK_Formatting_Tests : XCTestCase

@end

@implementation NSDate_MK_Formatting_Tests

- (void)test_formattedString {
    id string = @"2012-04-01";
    id date = [NSDate mk_dateFromString:string withFormat:[NSDate mk_dateFormatYYYYMMDDDashed]];
    
    id result = [date mk_formattedStringUsingFormat:[NSDate mk_dateFormatYYYYMMDDDashed]];
    assertThat(result, equalTo(string));
}

@end
