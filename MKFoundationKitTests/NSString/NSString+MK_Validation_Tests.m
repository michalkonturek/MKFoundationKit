//
//  NSString+MK_Validation_Tests.m
//  MKFoundation
//
//  Created by Michal Konturek on 23/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "BaseTest.h"

@interface NSString_MK_Validation_Tests : XCTestCase

@end

@implementation NSString_MK_Validation_Tests

- (void)test_isValidEmail_returns_true {
    BOOL result = [@"user@domain.com" mk_isValidEmail];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isValidEmail_returns_true_when_domain_is_two_parts {
    BOOL result = [@"user@email.domain.com" mk_isValidEmail];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isValidEmail_returns_true_when_domain_is_three_parts {
    BOOL result = [@"user@email.subdomain.domain.com" mk_isValidEmail];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isValidEmail_returns_false_when_no_at {
    BOOL result = [@"user.domain.com" mk_isValidEmail];
    assertThatBool(result, equalToBool(NO));
}

- (void)test_isValidEmail_returns_false_when_too_long_ending {
    BOOL result = [@"user@domain.comcom" mk_isValidEmail];
    assertThatBool(result, equalToBool(NO));
}

@end
