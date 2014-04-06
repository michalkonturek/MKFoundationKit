//
//  NSString+MK_Misc_Tests.m
//  MKFoundation
//
//  Copyright (c) 2013 Michal Konturek
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import <XCTest/XCTest.h>

#define HC_SHORTHAND
#import <OCHamcrest.h>

#import "BaseTest.h"

@interface NSString_MK_Misc_Tests : XCTestCase

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
    NSString *result = [self.input mk_firstComponentUsingSeparators:self.separators];
    assertThat(result, equalTo(@"Vexilla"));
}

- (void)test_lastComponent {
    NSString *result = [self.input mk_lastComponentUsingSeparators:self.separators];
    assertThat(result, equalTo(@"inferni."));
}

- (void)test_componentAtIndex {
    NSString *result = [self.input mk_componentAtIndex:2 usingSeparators:self.separators];
    assertThat(result, equalTo(@"prodeunt"));
}

- (void)test_componentAtIndex_when_empty_returns_empty {
    NSString *result = [@"" mk_componentAtIndex:3 usingSeparators:self.separators];
    assertThat(result, equalTo(@""));
}

- (void)test_componentAtIndex_when_index_higher_than_components_count__returns_empty {
    NSString *result = [self.input mk_componentAtIndex:4 usingSeparators:self.separators];
    assertThat(result, equalTo(@""));
}

- (void)test_componentAtIndex_when_index_negative__returns_empty {
    NSString *result = [self.input mk_componentAtIndex:-1 usingSeparators:self.separators];
    assertThat(result, equalTo(@""));
}

- (void)test_containsString_when_case_returns_true {
    NSString *term = @"regis";
    BOOL result = [self.input mk_containsString:term caseSensitive:YES];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_containsString_when_case_returns_false {
    NSString *term = @"Regis";
    BOOL result = [self.input mk_containsString:term caseSensitive:YES];
    assertThatBool(result, equalToBool(NO));
}

- (void)test_containsString_when_no_case_returns_true {
    NSString *term = @"Regis";
    BOOL result = [self.input mk_containsString:term caseSensitive:NO];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_containsString_when_no_case_returns_false {
    NSString *term = @"Regissss";
    BOOL result = [self.input mk_containsString:term caseSensitive:NO];
    assertThatBool(result, equalToBool(NO));
}

- (void)test_countOccurrencesOfStrings_when_case_sensitive {
    id input = @"AAaaAAaBbcbBbBCcaB";
    id terms = @[@"A", @"c"];
    NSInteger expected = 4 + 2;
    
    NSInteger result = [input mk_countOccurencesOfStrings:terms caseSensitive:YES];
    
    assertThatInteger(result, equalToInteger(expected));
}

- (void)test_countOccurrencesOfStrings_when_not_case_sensitive {
    id input = @"AAaaAAaBbcbBbBCcaB";
    id terms = @[@"A", @"c"];
    NSInteger expected = 8 + 3;
    
    NSInteger result = [input mk_countOccurencesOfStrings:terms caseSensitive:NO];
    
    assertThatInteger(result, equalToInteger(expected));
}

-  (void)test_range {
    id input = @"12345";
    
    NSRange result = [input mk_range];

    assertThatInteger(result.location, equalToInteger(0));
    assertThatInteger(result.length, equalToInteger([input length]));
}

@end
