//
//  NSNumber+MK_Manipulation_Tests.m
//  MKFoundation
//
//  Created by Michal Konturek on 02/07/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "BaseTest.h"

@interface NSNumber_MK_Manipulation_Tests : SenTestCase

@property (nonatomic, strong) NSNumber *input;

@end

@implementation NSNumber_MK_Manipulation_Tests

- (void)setUp {
    [super setUp];
    self.input = @2;
}

- (void)tearDown {
    self.input = nil;
    [super tearDown];
}

- (void)test_add_integer {
    id result = [self.input MK_add:@2];
    assertThat(result, equalToInteger(4));
}

- (void)test_add_fraction {
    id result = [self.input MK_add:@2.6];
    assertThat(result, equalToDouble(4.6));
}

- (void)test_subtract_integer {
    id result = [self.input MK_subtract:@1];
    assertThat(result, equalToInteger(1));
}

- (void)test_subtract_fraction {
    id result = [self.input MK_subtract:@1.2];
    assertThat(result, equalToDouble(0.8));
}

- (void)test_multiplyBy {
    id result = [self.input MK_multiplyBy:@2];
    assertThat(result, equalToInteger(4));
}

- (void)test_divideBy {
    id result = [self.input MK_divideBy:@4];
    assertThat(result, equalToDouble(0.5));
}

- (void)test_raiseToPower_positive {
    id result = [self.input MK_raiseToPower:3];
    assertThat(result, equalToInteger(8));
}

- (void)test_raiseToPower_negative {
    id result = [self.input MK_raiseToPower:-3];
    assertThat(result, equalToDouble(0.125));
}

@end
