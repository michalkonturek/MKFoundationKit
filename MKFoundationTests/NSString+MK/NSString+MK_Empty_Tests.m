//
//  NSString_MK_Empty_Tests
//  MKFoundation
//
//  Created by Michal Konturek on 23/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "BaseTest.h"

@interface NSString_MK_Empty_Tests : SenTestCase

@end

@implementation NSString_MK_Empty_Tests

- (void)test_isStringEmptyOrNil_returns_true {
    BOOL result = [NSString isStringEmptyOrNil:@""];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isStringEmptyOrNil_returns_true_when_spaces {
    BOOL result = [NSString isStringEmptyOrNil:@"   "];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isStringEmptyOrNil_returns_true_when_nil {
    BOOL result = [NSString isStringEmptyOrNil:nil];
    assertThatBool(result, equalToBool(YES));
}

- (void)test_isStringEmptyOrNil_returns_false {
    BOOL result = [NSString isStringEmptyOrNil:@"A B C D"];
    assertThatBool(result, equalToBool(NO));
}

@end
