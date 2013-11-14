//
//  NSMutableArray+MK_Queue.m
//  MKFoundation
//
//  Created by Michal Konturek on 14/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "BaseTest.h"

@interface NSMutableArray_MK_Queue : SenTestCase

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

- (void)test_enqueueObject {

}

- (void)test_dequeueObject {

}


@end
