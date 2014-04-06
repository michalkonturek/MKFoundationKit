//
//  NSDictionary+MK_Tests.m
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

@interface NSDictionary_MK_Tests : XCTestCase

@property (nonatomic, strong) NSDictionary *input;

@end

@implementation NSDictionary_MK_Tests

- (void)setUp {
    [super setUp];
    self.input = @{@"A": @"Adam", @"B": @"Bill", @"C": @"Charles", @"D": @"Daniel"};
}

- (void)tearDown {
    self.input = nil;
    [super tearDown];
}

- (void)test_renameKeysUsingMapping {
    id mapping = @{@"A": @1, @"B": @2, @"C": @3};
    id result = [self.input mk_renameKeysUsingMapping:mapping];
    
    assertThat([result allKeys], containsInAnyOrder(@1, @2, @3, @"D", nil));
}

- (void)test_dictionaryWithKeys {
    id keys = @[@"A", @"B"];
    id result = [self.input mk_dictionaryWithKeys:keys];
    
    assertThat(result, hasCountOf([keys count]));
    
    for (id key in result) {
        id expected = [self.input objectForKey:key];
        id object = [result objectForKey:key];
        assertThat(object, sameInstance(expected));
    }
}

- (void)test_dictionaryWithKeys_returns_empty_when_no_keys {
    id keys = @[];
    id result = [self.input mk_dictionaryWithKeys:keys];
    
    assertThat(result, hasCountOf([keys count]));
}

- (void)test_isEmpty_returns_true {
    BOOL result = [[NSDictionary dictionary] mk_isEmpty];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isEmpty_returns_false {
    BOOL result = [self.input mk_isEmpty];
    assertThatBool(result, equalToBool(NO));
}

@end
