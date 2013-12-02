//
//  NSNumber+MK_Negative_Tests.m
//  MKFoundation
//
//  Created by Michal Konturek on 02/07/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "BaseTest.h"

@interface NSNumber_MK_Negative_Tests : XCTestCase

@end

@implementation NSNumber_MK_Negative_Tests

- (void)test_minus_one_when_nsnumber_instance {
    id result = [NSNumber mk_minusOne];
    assertThat(result, equalTo(@-1));
}

- (void)test_minus_one_when_nsdecimalnumber_instance {
    id result = [NSDecimalNumber mk_minusOne];
    assertThat(result, equalTo(@-1));
}

- (void)test_negative_when_positive {
    id result = [@1 mk_negative];
    assertThat(result, equalTo(@-1));
}

- (void)test_negative_when_negative {
    id result = [@-1 mk_negative];
    assertThat(result, equalTo(@-1));
}

- (void)test_positive_when_positive {
    id result = [@1 mk_positive];
    assertThat(result, equalTo(@1));
}

- (void)test_positive_when_negative {
    id result = [@-1 mk_positive];
    assertThat(result, equalTo(@1));
}

- (void)test_negate_when_nsnumber_instance {
    id result = [@1 mk_negate];
    assertThat(result, equalTo(@-1));
}

- (void)test_negate_when_nsdecimalnumber_instance {
    id result = [[NSDecimalNumber one] mk_negate];
    assertThat(result, equalTo(@-1));
}

- (void)test_isPositive_returns_true {
    BOOL result = [@1 mk_isPositive];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isPositive_returns_false {
    BOOL result = [[NSNumber mk_minusOne] mk_isPositive];
    assertThatBool(result, equalToBool(NO));
}

- (void)test_isNegative_returns_true {
    BOOL result = [[NSNumber mk_minusOne] mk_isNegative];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isNegative_returns_false {
    BOOL result = [@1 mk_isNegative];
    assertThatBool(result, equalToBool(NO));
}

@end
