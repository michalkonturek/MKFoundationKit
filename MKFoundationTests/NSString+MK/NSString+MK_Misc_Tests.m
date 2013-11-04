//
//  NSString+MK_Misc_Tests.m
//  MKFoundation
//
//  Created by Michal Konturek on 04/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "BaseTest.h"

@interface NSString_MK_Misc_Tests : SenTestCase

@property (nonatomic, strong) NSString *target;

@end

@implementation NSString_MK_Misc_Tests

- (void)setUp {
    [super setUp];
    self.target = @"Vexilla regis prodeunt inferni.";
}

- (void)tearDown {
    self.target = nil;
    [super tearDown];
}

- (void)test_containsString_when_case_returns_true {
    NSString *term = @"regis";
    NSString *target = @"Vexilla regis prodeunt inferni.";
    BOOL result = [target MK_containsString:term caseSensitive:YES];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_containsString_when_case_returns_false {
    NSString *term = @"Regis";
    NSString *target = @"Vexilla regis prodeunt inferni.";
    BOOL result = [target MK_containsString:term caseSensitive:YES];
    assertThatBool(result, equalToBool(NO));
}

- (void)test_containsString_when_no_case_returns_true {
    NSString *term = @"Regis";
    NSString *target = @"Vexilla regis prodeunt inferni.";
    BOOL result = [target MK_containsString:term caseSensitive:NO];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_containsString_when_no_case_returns_false {
    NSString *term = @"Regissss";
    NSString *target = @"Vexilla regis prodeunt inferni.";
    BOOL result = [target MK_containsString:term caseSensitive:NO];
    assertThatBool(result, equalToBool(NO));
}

@end
