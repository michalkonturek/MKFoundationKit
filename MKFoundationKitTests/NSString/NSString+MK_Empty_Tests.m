//
//  NSString_MK_Empty_Tests
//  MKFoundation
//
//  Created by Michal Konturek on 23/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import <XCTest/XCTest.h>

#define HC_SHORTHAND
#import <OCHamcrest.h>

#import "BaseTest.h"

@interface NSString_MK_Empty_Tests : XCTestCase

@end

@implementation NSString_MK_Empty_Tests

- (void)test_isStringEmptyOrNil_returns_true {
    BOOL result = [NSString mk_isStringEmptyOrNil:@""];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isStringEmptyOrNil_returns_true_when_spaces {
    BOOL result = [NSString mk_isStringEmptyOrNil:@"   "];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isStringEmptyOrNil_returns_true_when_nil {
    BOOL result = [NSString mk_isStringEmptyOrNil:nil];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isStringEmptyOrNil_returns_false {
    BOOL result = [NSString mk_isStringEmptyOrNil:@"A B"];
    assertThatBool(result, equalToBool(NO));
}

- (void)test_trimmedString {
    NSString *input = [NSString stringWithFormat:@" ABCD "];
    NSString *result = [input mk_trimmedString];
    assertThat(result, equalTo(@"ABCD"));
}

@end
