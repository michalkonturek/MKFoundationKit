//
//  NSString+MK_Conversion_Tests.m
//  MKFoundation
//
//  Created by Michal Konturek on 23/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "BaseTest.h"

@interface NSString_MK_Conversion_Tests : XCTestCase

@end

@implementation NSString_MK_Conversion_Tests

- (void)test_numberWithInteger_when_numeric {
    NSString *input = @"101";
    NSNumber *result = [input mk_numberWithInteger];
    assertThat(result, equalTo(@101));
}

- (void)test_numberWithInteger_when_alphanumeric {
    NSString *input = @"101 ABCD";
    NSNumber *result = [input mk_numberWithInteger];
    assertThat(result, equalTo(@101));
}

- (void)test_numberWithLongLong_when_numeric {
    NSString *input = @"101111111111";
    NSNumber *result = [input mk_numberWithLongLong];
    assertThat(result, equalTo(@101111111111));
}

- (void)test_numberWithLongLong_when_alphanumeric {
    NSString *input = @"101111111111 ABCD";
    NSNumber *result = [input mk_numberWithLongLong];
    assertThat(result, equalTo(@101111111111));
}

@end
