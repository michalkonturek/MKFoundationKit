//
//  NSDate+MK_Components.m
//  MKFoundation
//
//  Created by Michal Konturek on 09/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSDate+MK_Components.h"

@implementation NSDate (MK_Components)

- (NSInteger)mk_year {
    METHOD_NOT_IMPLEMENTED
}

- (NSInteger)mk_month {
    METHOD_NOT_IMPLEMENTED
}

- (NSInteger)mk_week {
    METHOD_NOT_IMPLEMENTED
}

- (NSInteger)mk_weeekday {
    METHOD_NOT_IMPLEMENTED
}

- (NSInteger)mk_nthWeekday {
    METHOD_NOT_IMPLEMENTED
}

- (NSInteger)mk_day {
    METHOD_NOT_IMPLEMENTED
}

- (NSInteger)mk_hour {
    METHOD_NOT_IMPLEMENTED
}

- (NSInteger)mk_minutes {
    METHOD_NOT_IMPLEMENTED
}

- (NSInteger)mk_seconds {
    METHOD_NOT_IMPLEMENTED
}

- (NSDateComponents *)mk_components {
    return [[NSCalendar currentCalendar] components:DATE_COMPONENTS fromDate:self];
}

@end
