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

- (NSDate *)MK_dateByAddingDays:(NSInteger)days {
    return [self _dateByAdding:days ofUnit:NSDayCalendarUnit];
}

- (NSDate *)MK_dateByAddingWeeks:(NSInteger)weeks {
    return [self MK_dateByAddingDays:(weeks * 7)];
}

- (NSDate *)MK_dateByAddingMonths:(NSInteger)months {
    return [self _dateByAdding:months ofUnit:NSMonthCalendarUnit];
}

- (NSDate *)MK_dateByAddingYears:(NSInteger)months {
    return [self _dateByAdding:months ofUnit:NSYearCalendarUnit];
}

- (NSDate *)MK_dateBySubtractingDays:(NSInteger)days {
    return [self _dateByAdding:-days ofUnit:NSDayCalendarUnit];
}

- (NSDate *)MK_dateBySubtractingWeeks:(NSInteger)weeks {
    return [self MK_dateByAddingDays:-(weeks * 7)];
}

- (NSDate *)MK_dateBySubtractingMonths:(NSInteger)months {
    return [self _dateByAdding:-months ofUnit:NSMonthCalendarUnit];
}

- (NSDate *)MK_dateBySubtractingYears:(NSInteger)years {
    return [self _dateByAdding:-years ofUnit:NSYearCalendarUnit];
}

- (NSDate *)_dateByAdding:(NSInteger)value ofUnit:(NSCalendarUnit)unit {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    
    switch (unit) {
        case NSDayCalendarUnit:
            [components setDay:value];
            break;
        case NSMonthCalendarUnit:
            [components setMonth:value];
            break;
        default:
            [components setYear:value];
            break;
    }
    
    NSDate *date = [calendar dateByAddingComponents:components toDate:self options:0];
    return date;
}

- (NSInteger)MK_differenceInDaysToDate:(NSDate *)toDate {
    return [self _differenceInUnit:NSDayCalendarUnit toDate:toDate];
}

- (NSInteger)MK_differenceInMonthsToDate:(NSDate *)toDate {
    return [self _differenceInUnit:NSMonthCalendarUnit toDate:toDate];
}

- (NSInteger)MK_differenceInYearsToDate:(NSDate *)toDate {
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
