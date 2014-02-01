//
//  NSDate+MK_Comparison.m
//  MKFoundation
//
//  Created by Michal Konturek on 08/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
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
            ([components1 week] == [components2 week]));
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
