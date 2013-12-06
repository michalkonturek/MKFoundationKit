//
//  NSString+MK_UTF_Tests.m
//  MKFoundation
//
//  Created by Michal Konturek on 23/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "BaseTest.h"

@interface NSString_MK_UTF_Tests : XCTestCase

@end

@implementation NSString_MK_UTF_Tests

- (void)test_decodeUTF8 {
    NSString *input = @"rÃ³ do sÃ­t";
    NSString *result = [input mk_decodeUTF8];
    assertThat(result, containsString(@"ró do sít"));
}

@end
