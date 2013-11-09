//
//  NSDate+MK_Components_Tests.m
//  MKFoundation
//
//  Created by Michal Konturek on 09/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "BaseTest.h"

@interface NSDate_MK_Components_Tests : SenTestCase

@property (nonatomic, strong) NSDate *target;

@end

@implementation NSDate_MK_Components_Tests

- (void)setUp {
    [super setUp];
    self.target = [NSDate MK_dateFromString:@"07-01-2013"];
}

- (void)tearDown {
    self.target = nil;
    [super tearDown];
}

- (void)test_year {
    NSInteger result = [self.target mk_year];
    assertThatInteger(result, equalToInteger(2013));
}

- (void)test_week {
    NSInteger result = [self.target mk_year];
    assertThatInteger(result, equalToInteger(2));
}

- (void)test_weekday {
    NSInteger result = [self.target mk_weeekday];
    assertThatInteger(result, equalToInteger(1));
}

- (void)test_nthWeekday {
    NSInteger result = [self.target mk_nthWeekday];
    assertThatInteger(result, equalToInteger(1));
}

- (void)test_day {
    NSInteger result = [self.target mk_day];
    assertThatInteger(result, equalToInteger(7));
}

- (void)test_hour {
    
}

- (void)test_minute {
    
}

- (void)test_seconds {
    
}


@end
