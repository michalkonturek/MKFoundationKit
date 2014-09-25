//
//  NSDate+MK_Components.m
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

#import "NSDate+MK_Components.h"

@implementation NSDate (MK_Components)

- (NSInteger)mk_year {
    return [[self mk_components] year];
}

- (NSInteger)mk_month {
    return [[self mk_components] month];
}

- (NSInteger)mk_weekOfMonth {
    return [[self mk_components] weekOfMonth];
}

- (NSInteger)mk_weekOfYear {
    return [[self mk_components] weekOfYear];
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
