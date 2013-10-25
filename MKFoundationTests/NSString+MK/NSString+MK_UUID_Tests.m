//
//  NSString+MK_UUID_Tests.m
//  MKFoundation
//
//  Created by Michal Konturek on 25/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "BaseTest.h"

@interface NSString_MK_UUID_Tests : SenTestCase

@end

@implementation NSString_MK_UUID_Tests

- (void)test_stringWithUUID {
    NSString *result = [NSString MK_stringWithUUID];

    NSString *regex = @"/^[0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$/";
    
//    NSPredicate *email
}

@end
