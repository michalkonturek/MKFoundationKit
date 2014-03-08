//
//  NSObject+MK_Misc_Tests.m
//  MKFoundationKit
//
//  Created by Michal Konturek on 21/02/2014.
//  Copyright (c) 2014 Michal Konturek. All rights reserved.
//

#import <XCTest/XCTest.h>

#define HC_SHORTHAND
#import <OCHamcrest.h>

#import "BaseTest.h"

@interface NSObject_MK_Misc_Tests : XCTestCase

@end

@implementation NSObject_MK_Misc_Tests

- (void)test_exists_returns_true {
    id input = @1;
    assertThatBool([NSObject mk_exists:input], equalToBool(YES));
}

- (void)test_exists_returns_false_when_nil {
    id input = nil;
    assertThatBool([NSObject mk_exists:input], equalToBool(NO));
}

- (void)test_exists_returns_false_when_nsnull {
    id input = [NSNull null];
    assertThatBool([NSObject mk_exists:input], equalToBool(NO));
}

@end
