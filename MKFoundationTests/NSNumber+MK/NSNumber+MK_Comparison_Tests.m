//
//  NSNumber+MK_Comparison_Tests.m
//  MKFinancialKit
//
//  Created by Michal Konturek on 06/07/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "BaseTest.h"

@interface NSNumber_MK_Comparison_Tests : SenTestCase

@property (nonatomic, strong) NSArray *numbers;

@end

@implementation NSNumber_MK_Comparison_Tests

- (void)setUp {
    self.numbers = @[@1, @2, @10, @18];
}

- (void)tearDown {
    self.numbers = nil;
}

- (void)test_class_max {
    id expected = @18;
    id returned = [NSNumber max:self.numbers];
    assertThat(expected, equalTo(returned));
}

- (void)test_class_min {
    id expected = @1;
    id returned = [NSNumber min:self.numbers];
    assertThat(expected, equalTo(returned));
}

- (void)test_max {
    id expected = @31;
    id returned = [expected max:self.numbers];
    assertThat(expected, equalTo(returned));
}

- (void)test_min {
    id expected = @1;
    id returned = [@2 min:self.numbers];
    assertThat(expected, equalTo(returned));
}

- (void)test_isTheSame_returns_true {
    BOOL result = [@10 isTheSame:@10.0];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isTheSame_returns_false {
    BOOL result = [@10 isTheSame:@10.1];
    assertThatBool(result, equalToBool(NO));
}

- (void)test_isGreaterThan_returns_true {
    BOOL result = [@100 isGreaterThan:@10];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isGreaterThan_returns_false {
    BOOL result = [@10 isGreaterThan:@10.08];
    assertThatBool(result, equalToBool(NO));
}

- (void)test_isLessThan_returns_true {
    BOOL result = [@10 isLessThan:@18];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isLessThan_returns_false {
    BOOL result = [@19.5 isLessThan:@18];
    assertThatBool(result, equalToBool(NO));
}

@end
