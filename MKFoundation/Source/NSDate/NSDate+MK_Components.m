//
//  NSDate+MK_Components.m
//  MKFoundation
//
//  Created by Michal Konturek on 09/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSDate+MK_Components.h"

@implementation NSDate (MK_Components)

- (NSInteger)MK_year {
    return [[self MK_components] year];
}

- (NSInteger)MK_month {
    return [[self MK_components] month];
}

- (NSInteger)MK_week {
    return [[self MK_components] week];
}

- (NSInteger)MK_weeekday {

    /*
     NOTE: Depending on localization, week starts on Monday or Sunday.
     */
    
    return [[self MK_components] weekday];
}

- (NSInteger)MK_nthWeekday {
    return [[self MK_components] weekdayOrdinal];
}

- (NSInteger)MK_day {
    return [[self MK_components] day];
}

- (NSInteger)MK_hour {
    return [[self MK_components] hour];
}

- (NSInteger)MK_minutes {
    return [[self MK_components] minute];
}

- (NSInteger)MK_seconds {
    return [[self MK_components] second];
}

- (NSDateComponents *)MK_components {
    return [[NSCalendar currentCalendar] components:DATE_COMPONENTS fromDate:self];
}

@end
