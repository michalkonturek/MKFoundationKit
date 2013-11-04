//
//  NSString+MK_Misc_Tests.m
//  MKFoundation
//
//  Created by Michal Konturek on 04/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "BaseTest.h"

@interface NSString_MK_Misc_Tests : SenTestCase

@property (nonatomic, strong) NSString *input;
@property (nonatomic, strong) NSCharacterSet *separators;

@end

@implementation NSString_MK_Misc_Tests

- (void)setUp {
    [super setUp];
    self.input = @"Vexilla regis prodeunt inferni.";
    self.separators = [NSCharacterSet whitespaceCharacterSet];
}

- (void)tearDown {
    self.input = nil;
    self.separators = nil;
    [super tearDown];
}

- (void)test_firstComponent {
    NSString *result = [self.input MK_firstComponent:self.separators];
    assertThat(result, equalTo(@"Vexilla"));
}

- (void)test_lastComponent {
    NSString *result = [self.input MK_lastComponent:self.separators];
    assertThat(result, equalTo(@"inferni."));
}

- (void)test_componentAtIndex {
    NSString *result = [self.input MK_componentAtIndex:2 usingSeparators:self.separators];
    assertThat(result, equalTo(@"prodeunt"));
}

- (void)test_componentAtIndex_when_empty_returns_empty {
    NSString *result = [@"" MK_componentAtIndex:3 usingSeparators:self.separators];
    assertThat(result, equalTo(@""));
}

- (void)test_componentAtIndex_when_index_higher_than_components_count__returns_empty {
    NSString *result = [self.input MK_componentAtIndex:4 usingSeparators:self.separators];
    assertThat(result, equalTo(@""));
}

- (void)test_componentAtIndex_when_index_negative__returns_empty {
    NSString *result = [self.input MK_componentAtIndex:-1 usingSeparators:self.separators];
    assertThat(result, equalTo(@""));
}

- (void)test_containsString_when_case_returns_true {
    NSString *term = @"regis";
    BOOL result = [self.input MK_containsString:term caseSensitive:YES];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_containsString_when_case_returns_false {
    NSString *term = @"Regis";
    BOOL result = [self.input MK_containsString:term caseSensitive:YES];
    assertThatBool(result, equalToBool(NO));
}

- (void)test_containsString_when_no_case_returns_true {
    NSString *term = @"Regis";
    BOOL result = [self.input MK_containsString:term caseSensitive:NO];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_containsString_when_no_case_returns_false {
    NSString *term = @"Regissss";
    BOOL result = [self.input MK_containsString:term caseSensitive:NO];
    assertThatBool(result, equalToBool(NO));
}

@end
