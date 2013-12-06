//
//  NSMutableArray+MK_Stack.m
//  MKFoundation
//
//  Created by Michal Konturek on 13/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "BaseTest.h"

@interface NSMutableArray_MK_Stack : XCTestCase

@property (nonatomic, strong) NSMutableArray *target;

@end

@implementation NSMutableArray_MK_Stack

- (void)setUp {
    [super setUp];
    self.target = [NSMutableArray arrayWithArray:@[@1, @2, @3]];
}

- (void)tearDown {
    self.target = nil;
    [super tearDown];
}

- (void)test_pushObject {
    id expected = @0;;
    [self.target mk_pushObject:expected];
    id result = [self.target objectAtIndex:0];
    assertThat(result, sameInstance(expected));
}

- (void)test_pullObject {
    id expected = [self.target objectAtIndex:0];
    id result = [self.target mk_pullObject];
    assertThat(result, sameInstance(expected));
}

@end
