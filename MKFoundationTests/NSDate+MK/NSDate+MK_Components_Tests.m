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
    self.target = [NSDate mk_dateFromString:@"07-01-2013 20:02:15" withFormat:@"dd-MM-yyyy HH:mm:ss"];
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
    NSInteger result = [self.target mk_week];
    assertThatInteger(result, equalToInteger(2));
}

- (void)test_weekday {
    NSInteger result = [self.target mk_weekday];
    assertThatInteger(result, equalToInteger(2));
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
    NSInteger result = [self.target mk_hour];
    assertThatInteger(result, equalToInteger(20));
}

- (void)test_minute {
    NSInteger result = [self.target mk_minutes];
    assertThatInteger(result, equalToInteger(2));
}

- (void)test_seconds {
    NSInteger result = [self.target mk_seconds];
    assertThatInteger(result, equalToInteger(15));
}


@end
