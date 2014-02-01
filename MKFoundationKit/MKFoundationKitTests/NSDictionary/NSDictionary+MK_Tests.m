//
//  NSDictionary+MK_Tests.m
//  MKFoundation
//
//  Created by Michal Konturek on 24/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
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
