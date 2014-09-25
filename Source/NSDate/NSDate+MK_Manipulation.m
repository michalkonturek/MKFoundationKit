//
//  NSDate+MK_Manipulation.m
//  MKFoundation
//
//  Copyright (c) 2013 Michal Konturek
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
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

- (NSInteger)mk_differenceInHoursToDate:(NSDate *)toDate {
    return [self _differenceInUnit:NSCalendarUnitHour toDate:toDate];
}

- (NSInteger)mk_differenceInMinutesToDate:(NSDate *)toDate {
    return [self _differenceInUnit:NSCalendarUnitMinute toDate:toDate];
}

- (NSInteger)mk_differenceInSecondsToDate:(NSDate *)toDate {
    return [self _differenceInUnit:NSCalendarUnitSecond toDate:toDate];
}

- (NSInteger)_differenceInUnit:(NSCalendarUnit)unit toDate:(NSDate *)toDate {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:unit
                                               fromDate:self toDate:toDate options:0];
    
    switch (unit) {
        case NSCalendarUnitYear:
            return [components year];
            break;
        case NSCalendarUnitMonth:
            return [components month];
            break;
        case NSCalendarUnitDay:
            return [components day];
            break;
        case NSCalendarUnitHour:
            return [components hour];
            break;
        case NSCalendarUnitMinute:
            return [components minute];
            break;
        case NSCalendarUnitSecond:
            return [components second];
            break;
        default:
            return [components year];
            break;
    }
}

@end
