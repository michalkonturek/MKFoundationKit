//
//  NSMutableArray+MK_Queue.m
//  MKFoundation
//
//  Created by Michal Konturek on 14/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import <XCTest/XCTest.h>

#define HC_SHORTHAND
#import <OCHamcrest.h>

#import "BaseTest.h"

@interface NSMutableArray_MK_Queue : XCTestCase

@property (nonatomic, strong) NSMutableArray *target;

@end

@implementation NSMutableArray_MK_Queue

- (void)setUp {
    [super setUp];
    self.target = [NSMutableArray arrayWithArray:@[@1, @2, @3]];
}

- (void)tearDown {
    self.target = nil;
    [super tearDown];
}

- (void)test_enqueueObject_adds_element_at_the_end {
    id expected = @5;
    [self.target mk_enqueueObject:expected];
    id result = [self.target lastObject];
    
    assertThat(result, sameInstance(expected));
}

- (void)test_dequeueObject_when_empty_returns_nil {
    self.target = [NSMutableArray array];
    id result = [self.target mk_dequeueObject];
    
    assertThat(result, nilValue());
}

- (void)test_dequeueObject_returns_first_element {
    id expected = [self.target mk_firstObject];
    id result = [self.target mk_dequeueObject];
    
    assertThat(result, sameInstance(expected));
}

- (void)test_dequeueObject_removes_first_element {
    [self.target mk_dequeueObject];
    
    assertThat(self.target, hasCountOf(2));
    assertThat(self.target, contains(@2, @3, nil));
}

@end
