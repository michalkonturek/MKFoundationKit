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
    id target = @1;
    assertThatBool([target mk_exists], equalToBool(YES));
}

- (void)test_exists_returns_false_when_nil {
    id target = nil;
    assertThatBool([target mk_exists], equalToBool(NO));
}

- (void)test_exists_returns_false_when_nsnull {
    id target = [NSNull null];
    assertThatBool([target mk_exists], equalToBool(NO));
}

@end
