//
//  NSDate+MK_Components.h
//  MKFoundation
//
//  Created by Michal Konturek on 09/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DATE_COMPONENTS (NSYearCalendarUnit | NSMonthCalendarUnit | NSWeekCalendarUnit | NSWeekdayCalendarUnit | NSWeekdayOrdinalCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit)

@interface NSDate (MK_Components)

- (NSInteger)mk_year;
- (NSInteger)mk_month;
- (NSInteger)mk_week;
- (NSInteger)mk_weekday;
- (NSInteger)mk_nthWeekday;
- (NSInteger)mk_day;
- (NSInteger)mk_hour;
- (NSInteger)mk_minutes;
- (NSInteger)mk_seconds;

- (NSDateComponents *)mk_components;

@end
