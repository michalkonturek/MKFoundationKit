//
//  NSDate+MK_Manipulation.m
//  MKFoundation
//
//  Created by Michal Konturek on 22/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSDate+MK_Manipulation.h"

@implementation NSDate (MK_Manipulation)

- (NSDate *)dateByAddingDays:(NSInteger)days {
    return [self _dateByAdding:days ofUnit:NSCalendarUnitDay];
}

- (NSDate *)dateByAddingWeeks:(NSInteger)weeks {
    return [self dateByAddingDays:(weeks * 7)];
}

- (NSDate *)dateByAddingMonths:(NSInteger)months {
    return [self _dateByAdding:months ofUnit:NSCalendarUnitMonth];
}

- (NSDate *)dateByAddingYears:(NSInteger)months {
    return [self _dateByAdding:months ofUnit:NSCalendarUnitYear];
}

- (NSDate *)_dateByAdding:(NSInteger)value ofUnit:(NSCalendarUnit)unit {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    
    switch (unit) {
        case NSCalendarUnitDay:
            [components setDay:value];
            break;
        case NSCalendarUnitMonth:
            [components setMonth:value];
            break;
        default:
            [components setYear:value];
            break;
    }
    
    NSDate *date = [calendar dateByAddingComponents:components toDate:self options:0];
    return date;
}


- (NSDate *)dateBySubtractingDays:(NSInteger)days {
    METHOD_NOT_IMPLEMENTED
}

- (NSDate *)dateBySubtractingWeeks:(NSInteger)weeks {
    METHOD_NOT_IMPLEMENTED
}

- (NSDate *)dateBySubtractingMonths:(NSInteger)months {
    METHOD_NOT_IMPLEMENTED
}

- (NSDate *)dateBySubtractingYears:(NSInteger)years {
    METHOD_NOT_IMPLEMENTED
}

- (NSInteger)differenceInDaysToDate:(NSDate *)toDate {
    return [self _differenceInUnit:NSCalendarUnitDay toDate:toDate];
}

- (NSInteger)differenceInMonthsToDate:(NSDate *)toDate {
    return [self _differenceInUnit:NSCalendarUnitMonth toDate:toDate];
}

- (NSInteger)differenceInYearsToDate:(NSDate *)toDate {
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
