//
//  NSDate+MK_Creation.m
//  MKFoundation
//
//  Created by Michal Konturek on 22/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSDate+MK_Creation.h"

#import "NSDate+MK_Manipulation.h"
#import "NSDate+MK_Formatting.h"

@implementation NSDate (MK_Creation)

+ (NSDate *)mk_dateTomorrow {
    return [[NSDate date] mk_dateByAddingDays:1];
}

+ (NSDate *)mk_dateYesterday {
    return [[NSDate date] mk_dateBySubtractingDays:1];
}

+ (NSDate *)mk_dateWithoutTime {
    return [[NSDate date] mk_dateWithoutTime];
}

+ (NSDate *)mk_dateWithDaysFromNow:(NSInteger)days {
    return [[NSDate date] mk_dateByAddingDays:days];
}

+ (NSDate *)mk_dateFromString:(NSString *)string {
    return [self mk_dateFromString:string withFormat:[NSDate mk_dateFormatDDMMYYYYDashed]];
}

+ (NSDate *)mk_dateFromString:(NSString *)string withFormat:(NSString *)format {
    
    if ((NSNull *)string == [NSNull null] || string == nil) {
        return nil;
    }
    
    if (format == nil) {
        format = [NSDate mk_dateFormatDDMMYYYYDashed];
    }
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    NSDate *result = [formatter dateFromString:string];
    
    return result;
}

- (NSDate *)mk_dateWithoutTime {
    NSString *formattedString = [self mk_formattedString];

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:[NSDate mk_dateFormatDDMMYYYYDashed]];
    NSDate *result = [formatter dateFromString:formattedString];
    
    return result;
}

@end
