//
//  NSMutableArray+MK_Tests.m
//  MKFoundation
//
//  Created by Michal Konturek on 25/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "BaseTest.h"

@interface NSMutableArray_MK_Tests : SenTestCase

@end

@implementation NSMutableArray_MK_Tests

- (void)test_safeAddObject {
    NSMutableArray *result = [NSMutableArray LINQ_empty];
    [result MK_safeAddObject:nil];
    assertThat(result, hasCountOf(0));
}

@end
