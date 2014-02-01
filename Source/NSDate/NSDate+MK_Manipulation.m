//
//  NSDate+MK_Manipulation.m
//  MKFoundation
//
//  Created by Michal Konturek on 22/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSDate+MK_Manipulation.h"

@implementation NSDate (MK_Manipulation)

- (NSDate *)mk_dateByAddingDays:(NSInteger)days {
    return [self _dateByAdding:days ofUnit:NSCalendarUnitDay];
}

- (NSDate *)mk_dateByAddingWeeks:(NSInteger)weeks {
    return [self mk_dateByAddingDays:(weeks * 7)];
}

- (NSDate *)mk_dateByAddingMonths:(NSInteger)months {
    return [self _dateByAdding:months ofUnit:NSCalendarUnitMonth];
}

- (NSDate *)mk_dateByAddingYears:(NSInteger)months {
    return [self _dateByAdding:months ofUnit:NSCalendarUnitYear];
}

- (NSDate *)mk_dateByAddingHours:(NSInteger)hours {
    return [self _dateByAdding:hours ofUnit:NSCalendarUnitHour];
}

- (NSDate *)mk_dateByAddingMinutes:(NSInteger)minutes {
    return [self _dateByAdding:minutes ofUnit:NSCalendarUnitMinute];
}

- (NSDate *)mk_dateByAddingSeconds:(NSInteger)seconds {
    return [self _dateByAdding:seconds ofUnit:NSCalendarUnitSecond];
}

- (NSDate *)mk_dateBySubtractingDays:(NSInteger)days {
    return [self _dateByAdding:-days ofUnit:NSCalendarUnitDay];
}

- (NSDate *)mk_dateBySubtractingWeeks:(NSInteger)weeks {
    return [self mk_dateByAddingDays:-(weeks * 7)];
}

- (NSDate *)mk_dateBySubtractingMonths:(NSInteger)months {
    return [self _dateByAdding:-months ofUnit:NSCalendarUnitMonth];
}

- (NSDate *)mk_dateBySubtractingYears:(NSInteger)years {
    return [self _dateByAdding:-years ofUnit:NSCalendarUnitYear];
}

- (NSDate *)mk_dateBySubtractingHours:(NSInteger)hours {
    return [self _dateByAdding:-hours ofUnit:NSCalendarUnitHour];
}

- (NSDate *)mk_dateBySubtractingMinutes:(NSInteger)minutes {
    return [self _dateByAdding:-minutes ofUnit:NSCalendarUnitMinute];
}

- (NSDate *)mk_dateBySubtractingSeconds:(NSInteger)seconds {
    return [self _dateByAdding:-seconds ofUnit:NSCalendarUnitSecond];
}

- (NSDate *)_dateByAdding:(NSInteger)value ofUnit:(NSCalendarUnit)unit {    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    
    switch (unit) {
        case NSCalendarUnitYear:
            [components setYear:value];
            break;
        case NSCalendarUnitMonth:
            [components setMonth:value];
            break;
        case NSCalendarUnitDay:
            [components setDay:value];
            break;
        case NSCalendarUnitHour:
            [components setHour:value];
            break;
        case NSCalendarUnitMinute:
            [components setMinute:value];
            break;
        case NSCalendarUnitSecond:
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
    return [self _differenceInUnit:NSCalendarUnitDay toDate:toDate];
}

- (NSInteger)mk_differenceInMonthsToDate:(NSDate *)toDate {
    return [self _differenceInUnit:NSCalendarUnitMonth toDate:toDate];
}

- (NSInteger)mk_differenceInYearsToDate:(NSDate *)toDate {
    return [self _differenceInUnit:NSCalendarUnitYear toDate:toDate];
}

- (NSInteger)_differenceInUnit:(NSCalendarUnit)unit toDate:(NSDate *)toDate {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:unit
                                               fromDate:self toDate:toDate options:0];
    
    switch (unit) {
        case NSCalendarUnitDay:
            return [components day];
            break;
        case NSCalendarUnitMonth:
            return [components month];
            break;
        default:
            return [components year];
            break;
    }
}

@end
