//
//  NSNumber+Negative_Tests.m
//  MKFinancialKit
//
//  Created by Michal Konturek on 02/07/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "BaseTest.h"

@interface NSNumber_MK_Negative_Tests : SenTestCase

@end

@implementation NSNumber_MK_Negative_Tests

- (void)test_minus_one_when_nsnumber_instance {
    id result = [NSNumber minus_one];
    assertThat(result, equalTo(@-1));
}

- (void)test_minus_one_when_nsdecimalnumber_instance {
    id result = [NSDecimalNumber minus_one];
    assertThat(result, equalTo(@-1));
}

- (void)test_negate_when_nsnumber_instance {
    id result = [@1 negate];
    assertThat(result, equalTo(@-1));
}

- (void)test_negate_when_nsdecimalnumber_instance {
    id result = [[NSDecimalNumber one] negate];
    assertThat(result, equalTo(@-1));
}

@end
