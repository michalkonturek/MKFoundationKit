//
//  NSDate+MK_Comparison.m
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

#import "NSDate+MK_Comparison.h"

#import "NSDate+MK_Components.h"
#import "NSDate+MK_Creation.h"
#import "NSDate+MK_Manipulation.h"

@implementation NSDate (MK_Comparison)

- (BOOL)mk_isToday {
    return [self mk_isEqualToDateIgnoringTime:[NSDate date]];
}

- (BOOL)mk_isTomorrow {
    return [self mk_isEqualToDateIgnoringTime:[NSDate mk_dateTomorrow]];
}

- (BOOL)mk_isYesterday {
    return [self mk_isEqualToDateIgnoringTime:[NSDate mk_dateYesterday]];
}

- (BOOL)mk_isThisWeek {
    return [self mk_isSameWeekAsDate:[NSDate date]];
}

- (BOOL)mk_isNextWeek {
    return [self mk_isSameWeekAsDate:[[NSDate date] mk_dateByAddingWeeks:1]];
}

- (BOOL)mk_isLastWeek {
    return [self mk_isSameWeekAsDate:[[NSDate date] mk_dateBySubtractingWeeks:1]];
}

- (BOOL)mk_isSameWeekAsDate:(NSDate *)other {
    
    /*
     NOTE: Depending on localization, week starts on Monday or Sunday.
     */
    
    NSDateComponents *components1 = [self mk_components];
    NSDateComponents *components2 = [other mk_components];
    
    return (([components1 year] == [components2 year]) &&
            ([components1 weekOfYear] == [components2 weekOfYear]));
}

- (BOOL)mk_isThisYear {
    return [self mk_isSameYearAsDate:[NSDate date]];
}

- (BOOL)mk_isNextYear {
    return [self mk_isSameYearAsDate:[[NSDate date] mk_dateByAddingYears:1]];
}

- (BOOL)mk_isLastYear {
    return [self mk_isSameYearAsDate:[[NSDate date] mk_dateBySubtractingYears:1]];
}

- (BOOL)mk_isSameYearAsDate:(NSDate *)other {
    NSDateComponents *components1 = [self mk_components];
    NSDateComponents *components2 = [other mk_components];
    
    return ([components1 year] == [components2 year]);
}

- (BOOL)mk_isEarlierThanDate:(NSDate *)other {
    return ([self compare:other] == NSOrderedAscending);
}

- (BOOL)mk_isLaterThanDate:(NSDate *)other {
    return ([self compare:other] == NSOrderedDescending);
}

- (BOOL)mk_isEqualToDateIgnoringTime:(NSDate *)other {
    NSDateComponents *components1 = [self mk_components];
    NSDateComponents *components2 = [other mk_components];
    
    return (([components1 year] == [components2 year]) &&
            ([components1 month] == [components2 month]) &&
            ([components1 day] == [components2 day]));
}

@end
