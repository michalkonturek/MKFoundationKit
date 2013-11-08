//
//  NSDate+MK_Creation.m
//  MKFoundation
//
//  Created by Michal Konturek on 22/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSDate+MK_Creation.h"

@implementation NSDate (MK_Creation)

+ (NSDate *)MK_dateTomorrow {
    return [[NSDate date] MK_dateByAddingDays:1];
}

+ (NSDate *)MK_dateYesterday {
    return [[NSDate date] MK_dateBySubtractingDays:1];
}

+ (NSDate *)MK_dateWithoutTime {
    return [[NSDate date] MK_dateWithoutTime];
}

+ (NSDate *)MK_dateWithDaysFromNow:(NSInteger)days {
    return [[NSDate date] MK_dateByAddingDays:days];
}

+ (NSDate *)MK_dateFromString:(NSString *)string {
    return [self MK_dateFromString:string withFormat:[NSDate MK_dateFormatDDMMYYYYDashed]];
}

+ (NSDate *)MK_dateFromString:(NSString *)string withFormat:(NSString *)format {
    
    if ((NSNull *)string == [NSNull null] || string == nil) {
        return nil;
    }
    
    if (format == nil) {
        format = [NSDate MK_dateFormatDDMMYYYYDashed];
    }
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    NSDate *result = [formatter dateFromString:string];
    
    return result;
}

- (NSDate *)MK_dateWithoutTime {
    NSString *formattedString = [self MK_formattedString];

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:[NSDate MK_dateFormatDDMMYYYYDashed]];
    NSDate *result = [formatter dateFromString:formattedString];
    
    return result;
}

@end
