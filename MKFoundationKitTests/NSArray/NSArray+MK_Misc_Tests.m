//
//  NSArray+MK_Misc_Tests.m
//  MKFoundation
//
//  Created by Michal Konturek on 25/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import <XCTest/XCTest.h>

#define HC_SHORTHAND
#import <OCHamcrest.h>

#import "BaseTest.h"

@interface NSArray_MK_Misc_Tests : XCTestCase

@property (nonatomic, strong) NSArray *target;

@end

@implementation NSArray_MK_Misc_Tests

- (void)setUp {
    [super setUp];
    self.target = @[@1, @2, @3];
}

- (void)tearDown {
    self.target = nil;
    [super tearDown];
}

- (void)test_isEmpty_returns_true {
    BOOL result = [[NSArray array] mk_isEmpty];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isEmpty_returns_false {
    BOOL result = [self.target mk_isEmpty];
    assertThatBool(result, equalToBool(NO));
}

- (void)test_firstObject_when_empty_returns_nil {
    self.target = [NSArray array];
    id result = [self.target mk_firstObject];
    
    assertThat(result, nilValue());
}

- (void)test_max {
    NSNumber *result = [self.target mk_max];
    assertThat(result, equalToInteger(3));
}

- (void)test_max_returns_zero_when_empty {
    NSNumber *result = [[NSArray array] mk_max];
    assertThat(result, equalToInteger(0));
}

- (void)test_min {
    NSNumber *result = [self.target mk_min];
    assertThat(result, equalToInteger(1));
}

- (void)test_min_returns_zero_when_empty {
    NSNumber *result = [[NSArray array] mk_min];
    assertThat(result, equalToInteger(0));
}

- (void)test_dequeueObject_returns_first_element {
    id expected = [self.target objectAtIndex:0];
    id result = [self.target mk_firstObject];
    
    assertThat(result, sameInstance(expected));
}

@end
