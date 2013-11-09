//
//  NSDate+MK_Components.h
//  MKFoundation
//
//  Created by Michal Konturek on 09/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSDate+MK.h"

#define DATE_COMPONENTS (NSYearCalendarUnit | NSMonthCalendarUnit | NSWeekCalendarUnit | NSWeekdayCalendarUnit | NSWeekdayOrdinalCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit)

@interface NSDate (MK_Components)

- (NSInteger)MK_year;
- (NSInteger)MK_month;
- (NSInteger)MK_week;
- (NSInteger)MK_weeekday;
- (NSInteger)MK_nthWeekday;
- (NSInteger)MK_day;
- (NSInteger)MK_hour;
- (NSInteger)MK_minutes;
- (NSInteger)MK_seconds;

- (NSDateComponents *)MK_components;

@end
