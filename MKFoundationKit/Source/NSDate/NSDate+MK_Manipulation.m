//
//  NSDate+MK_Manipulation.m
//  MKFoundation
//
//  Created by Michal Konturek on 22/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSDate+MK_Manipulation.h"

@implementation NSDate (MK_Manipulation)

/*
 From iOS 7 NS<unit>CalendarUnit is deprecated and replaced by NSCalendarUnit<unit>.
 At the moment Travis CI does not have Xcode 5 installed, so in otder to pass
 tests, the legacy typedef ENUM must be used.
 */

- (NSDate *)mk_dateByAddingDays:(NSInteger)days {
    return [self _dateByAdding:days ofUnit:NSDayCalendarUnit];
}

- (NSDate *)mk_dateByAddingWeeks:(NSInteger)weeks {
    return [self mk_dateByAddingDays:(weeks * 7)];
}

- (NSDate *)mk_dateByAddingMonths:(NSInteger)months {
    return [self _dateByAdding:months ofUnit:NSMonthCalendarUnit];
}

- (NSDate *)mk_dateByAddingYears:(NSInteger)months {
    return [self _dateByAdding:months ofUnit:NSYearCalendarUnit];
}

- (NSDate *)mk_dateByAddingHours:(NSInteger)hours {
    return [self _dateByAdding:hours ofUnit:NSHourCalendarUnit];
}

- (NSDate *)mk_dateByAddingMinutes:(NSInteger)minutes {
    return [self _dateByAdding:minutes ofUnit:NSMinuteCalendarUnit];
}

- (NSDate *)mk_dateByAddingSeconds:(NSInteger)seconds {
    return [self _dateByAdding:seconds ofUnit:NSSecondCalendarUnit];
}

- (NSDate *)mk_dateBySubtractingDays:(NSInteger)days {
    return [self _dateByAdding:-days ofUnit:NSDayCalendarUnit];
}

- (NSDate *)mk_dateBySubtractingWeeks:(NSInteger)weeks {
    return [self mk_dateByAddingDays:-(weeks * 7)];
}

- (NSDate *)mk_dateBySubtractingMonths:(NSInteger)months {
    return [self _dateByAdding:-months ofUnit:NSMonthCalendarUnit];
}

- (NSDate *)mk_dateBySubtractingYears:(NSInteger)years {
    return [self _dateByAdding:-years ofUnit:NSYearCalendarUnit];
}

- (NSDate *)mk_dateBySubtractingHours:(NSInteger)hours {
    return [self _dateByAdding:-hours ofUnit:NSHourCalendarUnit];
}

- (NSDate *)mk_dateBySubtractingMinutes:(NSInteger)minutes {
    return [self _dateByAdding:-minutes ofUnit:NSMinuteCalendarUnit];
}

- (NSDate *)mk_dateBySubtractingSeconds:(NSInteger)seconds {
    return [self _dateByAdding:-seconds ofUnit:NSSecondCalendarUnit];
}

- (NSDate *)_dateByAdding:(NSInteger)value ofUnit:(NSCalendarUnit)unit {    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    
    switch (unit) {
        case NSYearCalendarUnit:
            [components setYear:value];
            break;
        case NSMonthCalendarUnit:
            [components setMonth:value];
            break;
        case NSDayCalendarUnit:
            [components setDay:value];
            break;
        case NSHourCalendarUnit:
            [components setHour:value];
            break;
        case NSMinuteCalendarUnit:
            [components setMinute:value];
            break;
        case NSSecondCalendarUnit:
            [components setSecond:value];
            break;
        default:
            break;
    }

    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *date = [calendar dateByAddingComponents:components toDate:self options:0];
    return date;
}

- (NSInteger)mk_differenceInDaysToDate:(NSDate *)toDate {
    return [self _differenceInUnit:NSDayCalendarUnit toDate:toDate];
}

- (NSInteger)mk_differenceInMonthsToDate:(NSDate *)toDate {
    return [self _differenceInUnit:NSMonthCalendarUnit toDate:toDate];
}

- (NSInteger)mk_differenceInYearsToDate:(NSDate *)toDate {
    return [self _differenceInUnit:NSYearCalendarUnit toDate:toDate];
}

- (NSInteger)_differenceInUnit:(NSCalendarUnit)unit toDate:(NSDate *)toDate {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:unit
                                               fromDate:self toDate:toDate options:0];
    
    switch (unit) {
        case NSDayCalendarUnit:
            return [components day];
            break;
        case NSMonthCalendarUnit:
            return [components month];
            break;
        default:
            return [components year];
            break;
    }
}

@end
