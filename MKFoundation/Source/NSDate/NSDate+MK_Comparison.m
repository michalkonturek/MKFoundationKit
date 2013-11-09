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
    return [self MK_isSameWeekAsDate:[NSDate date]];
}

- (BOOL)MK_isNextWeek {
    return [self MK_isSameWeekAsDate:[[NSDate date] MK_dateByAddingWeeks:1]];
}

- (BOOL)MK_isLastWeek {
    return [self MK_isSameWeekAsDate:[[NSDate date] MK_dateBySubtractingWeeks:1]];
}

- (BOOL)MK_isSameWeekAsDate:(NSDate *)other {
    
    /*
     NOTE: Depending on localization, week starts on Monday or Sunday.
     */
    
    NSDateComponents *components1 = [self MK_components];
    NSDateComponents *components2 = [other MK_components];
    
    return (([components1 year] == [components2 year]) &&
            ([components1 week] == [components2 week]));
}

- (BOOL)MK_isThisYear {
    return [self MK_isSameYearAsDate:[NSDate date]];
}

- (BOOL)MK_isNextYear {
    return [self MK_isSameYearAsDate:[[NSDate date] MK_dateByAddingYears:1]];
}

- (BOOL)MK_isLastYear {
    return [self MK_isSameYearAsDate:[[NSDate date] MK_dateBySubtractingYears:1]];
}

- (BOOL)MK_isSameYearAsDate:(NSDate *)other {
    NSDateComponents *components1 = [self MK_components];
    NSDateComponents *components2 = [other MK_components];
    
    return ([components1 year] == [components2 year]);
}

- (BOOL)MK_isEarlierThanDate:(NSDate *)other {
    return ([self compare:other] == NSOrderedAscending);
}

- (BOOL)MK_isLaterThanDate:(NSDate *)other {
    return ([self compare:other] == NSOrderedDescending);
}

- (BOOL)MK_isEqualToDateIgnoringTime:(NSDate *)other {
    NSDateComponents *components1 = [self MK_components];
    NSDateComponents *components2 = [other MK_components];
    
    return (([components1 year] == [components2 year]) &&
            ([components1 month] == [components2 month]) &&
            ([components1 day] == [components2 day]));
}

@end
