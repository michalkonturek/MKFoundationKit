//
//  NSDate+MK_Comparison.m
//  MKFoundation
//
//  Created by Michal Konturek on 08/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSDate+MK_Comparison.h"

@implementation NSDate (MK_Comparison)

- (BOOL)MK_isToday {
    return [self MK_isEqualToDateIgnoringTime:[NSDate date]];
}

- (BOOL)MK_isTomorrow {
    return [self MK_isEqualToDateIgnoringTime:[NSDate MK_dateTomorrow]];
}

- (BOOL)MK_isYesterday {
    return [self MK_isEqualToDateIgnoringTime:[NSDate MK_dateYesterday]];
}

- (BOOL)MK_isThisWeek {
    METHOD_NOT_IMPLEMENTED
}

- (BOOL)MK_isNextWeek {
    METHOD_NOT_IMPLEMENTED
}

- (BOOL)MK_isLastWeek {
    METHOD_NOT_IMPLEMENTED
}

- (BOOL)MK_isSameWeekAsDate:(NSDate *)date {
    METHOD_NOT_IMPLEMENTED
}

- (BOOL)MK_isThisYear {
    METHOD_NOT_IMPLEMENTED
}

- (BOOL)MK_isNextYear {
    METHOD_NOT_IMPLEMENTED
}

- (BOOL)MK_isLastYear {
    METHOD_NOT_IMPLEMENTED
}

- (BOOL)MK_isSameYearAsDate:(NSDate *)date {
    METHOD_NOT_IMPLEMENTED
}

- (BOOL)MK_isEarlierThanDate:(NSDate *)date {
    METHOD_NOT_IMPLEMENTED
}

- (BOOL)MK_isLaterThanDate:(NSDate *)date {
    METHOD_NOT_IMPLEMENTED
}

- (BOOL)MK_isEqualToDateIgnoringTime:(NSDate *)date {
    NSDateComponents *components1 = [[NSCalendar currentCalendar] components:DATE_COMPONENTS fromDate:self];
    NSDateComponents *components2 = [[NSCalendar currentCalendar] components:DATE_COMPONENTS fromDate:date];
    return (([components1 year] == [components2 year]) &&
            ([components1 month] == [components2 month]) &&
            ([components1 day] == [components2 day]));
}

@end
