//
//  NSArray+MK_Tests.m
//  MKFoundation
//
//  Created by Michal Konturek on 25/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "BaseTest.h"

@interface NSArray_MK_Tests : SenTestCase

@property (nonatomic, strong) NSArray *input;

@end

@implementation NSArray_MK_Tests

- (void)setUp {
    [super setUp];
    self.input = @[@1, @2, @3];
}

- (void)tearDown {
    self.input = nil;
    [super tearDown];
}

- (void)test_isEmpty_returns_true {
    BOOL result = [[NSArray LINQ_empty] MK_isEmpty];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isEmpty_returns_false {
    BOOL result = [self.input MK_isEmpty];
    assertThatBool(result, equalToBool(NO));
}

@end
