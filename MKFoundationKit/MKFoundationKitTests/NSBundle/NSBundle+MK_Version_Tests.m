//
//  NSBundle+MK_Version_Tests.m
//  MKFoundationKit
//
//  Created by Michal Konturek on 07/03/2014.
//  Copyright (c) 2014 Michal Konturek. All rights reserved.
//

#import <XCTest/XCTest.h>

#define HC_SHORTHAND
#import <OCHamcrest.h>

#import "BaseTest.h"

@interface NSBundle_MK_Version_Tests : XCTestCase

@end

@implementation NSBundle_MK_Version_Tests

- (void)test_build {
    id expected = @"1.0";
    id result = [[NSBundle mainBundle] mk_build];
    assertThat(result, equalTo(expected));
}

- (void)test_name {
    id expected = @"MKFoundationKit";
    id result = [[NSBundle mainBundle] mk_name];
    assertThat(result, equalTo(expected));
}

- (void)test_version {
    id expected = @"1.2";
    id result = [[NSBundle mainBundle] mk_version];
    assertThat(result, equalTo(expected));
}

@end
