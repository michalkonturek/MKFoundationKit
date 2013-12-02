//
//  NSNumber+MK_Creation_Tests.m
//  MKFoundation
//
//  Created by Michal Konturek on 02/07/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "BaseTest.h"

@interface NSNumber_MK_Creation_Tests : SenTestCase

@end

@implementation NSNumber_MK_Creation_Tests

- (void)test_createFrom_when_nsnumber_class {
    id result = [NSNumber mk_createFrom:[NSNumber numberWithInteger:1]];

    /*
     NOTE: NSNumber is class cluster; use objType to get a specific type.
     https://developer.apple.com/library/mac/#documentation/cocoa/Reference/Foundation/Classes/NSNumber_Class/Reference/Reference.html
     */
    
    assertThatBool([result isMemberOfClass:[NSDecimalNumber class]], equalToBool(NO));
}

- (void)test_createFrom_when_nsdecimalnumber_class {
    id result = [NSDecimalNumber mk_createFrom:@1];
    
    NSLog(@"%@", [result class]);
    
    assertThatBool([result isMemberOfClass:[NSDecimalNumber class]], equalToBool(YES));
}


@end
