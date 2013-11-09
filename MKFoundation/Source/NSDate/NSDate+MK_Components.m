//
//  NSDate+MK_Components.m
//  MKFoundation
//
//  Created by Michal Konturek on 09/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSDate+MK_Components.h"

@implementation NSDate (MK_Components)

- (NSInteger)year {
    METHOD_NOT_IMPLEMENTED
}

- (NSInteger)month {
    METHOD_NOT_IMPLEMENTED
}

- (NSInteger)week {
    METHOD_NOT_IMPLEMENTED
}

- (NSInteger)weeekday {
    METHOD_NOT_IMPLEMENTED
}

- (NSInteger)nthWeekday {
    METHOD_NOT_IMPLEMENTED
}

- (NSInteger)day {
    METHOD_NOT_IMPLEMENTED
}

- (NSInteger)hour {
    METHOD_NOT_IMPLEMENTED
}

- (NSInteger)minute {
    METHOD_NOT_IMPLEMENTED
}

- (NSInteger)second {
    METHOD_NOT_IMPLEMENTED
}

- (NSDateComponents *)components {
    return [[NSCalendar currentCalendar] components:DATE_COMPONENTS fromDate:self];
}

@end
