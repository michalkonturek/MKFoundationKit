//
//  NSNumber+MK_Comparison_Tests.m
//  MKFoundation
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
    id returned = [NSNumber mk_max:self.numbers];
    assertThat(expected, equalTo(returned));
}

- (void)test_class_min {
    id expected = @1;
    id returned = [NSNumber mk_min:self.numbers];
    assertThat(expected, equalTo(returned));
}

- (void)test_max {
    id expected = @31;
    id returned = [expected mk_max:self.numbers];
    assertThat(expected, equalTo(returned));
}

- (void)test_min {
    id expected = @1;
    id returned = [@2 mk_min:self.numbers];
    assertThat(expected, equalTo(returned));
}

- (void)test_isTheSame_returns_true {
    BOOL result = [@10 mk_isTheSame:@10.0];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isTheSame_returns_false {
    BOOL result = [@10 mk_isTheSame:@10.1];
    assertThatBool(result, equalToBool(NO));
}

- (void)test_isGreaterThan_returns_true {
    BOOL result = [@100 mk_isGreaterThan:@10];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isGreaterThan_returns_false {
    BOOL result = [@10 mk_isGreaterThan:@10.08];
    assertThatBool(result, equalToBool(NO));
}

- (void)test_isLessThan_returns_true {
    BOOL result = [@10 mk_isLessThan:@18];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isLessThan_returns_false {
    BOOL result = [@19.5 mk_isLessThan:@18];
    assertThatBool(result, equalToBool(NO));
}

- (void)test_isEven_returns_true {
    BOOL result = [@22 mk_isEven];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isEven_returns_true_when_zero {
    BOOL result = [@0 mk_isEven];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isEven_returns_false {
    BOOL result = [@1 mk_isEven];
    assertThatBool(result, equalToBool(NO));
}

- (void)test_isOdd_returns_true {
    BOOL result = [@3 mk_isOdd];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isOdd_returns_true_when_fraction {
    BOOL result = [@2.2 mk_isOdd];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isOdd_returns_false {
    BOOL result = [@4 mk_isOdd];
    assertThatBool(result, equalToBool(NO));
}

@end
