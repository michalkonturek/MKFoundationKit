//
//  NSDate+MK_Components.m
//  MKFoundation
//
//  Created by Michal Konturek on 09/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSDate+MK_Components.h"

@implementation NSDate (MK_Components)

- (NSInteger)mk_year {
    return [[self mk_components] year];
}

- (NSInteger)mk_month {
    return [[self mk_components] month];
}

- (NSInteger)mk_week {
    return [[self mk_components] week];
}

- (NSInteger)mk_weekday {

    /*
     NOTE: Depending on localization, week starts on Monday or Sunday.
     */
    
    return [[self mk_components] weekday];
}

- (NSInteger)mk_nthWeekday {
    return [[self mk_components] weekdayOrdinal];
}

- (NSInteger)mk_day {
    return [[self mk_components] day];
}

- (NSInteger)mk_hour {
    return [[self mk_components] hour];
}

- (NSInteger)mk_minutes {
    return [[self mk_components] minute];
}

- (NSInteger)mk_seconds {
    return [[self mk_components] second];
}

- (NSDateComponents *)mk_components {
    return [[NSCalendar currentCalendar] components:DATE_COMPONENTS fromDate:self];
}

@end
