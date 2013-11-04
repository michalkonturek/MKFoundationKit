//
//  NSString_MK_Empty_Tests
//  MKFoundation
//
//  Created by Michal Konturek on 23/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "BaseTest.h"

@interface NSString_MK_Empty_Tests : SenTestCase

@end

@implementation NSString_MK_Empty_Tests

- (void)test_isStringEmptyOrNil_returns_true {
    BOOL result = [NSString MK_isStringEmptyOrNil:@""];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isStringEmptyOrNil_returns_true_when_spaces {
    BOOL result = [NSString MK_isStringEmptyOrNil:@"   "];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isStringEmptyOrNil_returns_true_when_nil {
    BOOL result = [NSString MK_isStringEmptyOrNil:nil];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isStringEmptyOrNil_returns_false {
    BOOL result = [NSString MK_isStringEmptyOrNil:@"A B"];
    assertThatBool(result, equalToBool(NO));
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

- (void)test_trimmedString {
    NSString *input = [NSString stringWithFormat:@" ABCD "];
    NSString *result = [input MK_trimmedString];
    assertThat(result, equalTo(@"ABCD"));
}

@end
