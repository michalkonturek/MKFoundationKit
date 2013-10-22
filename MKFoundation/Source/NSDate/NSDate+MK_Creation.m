//
//  NSDate+MK_Creation.m
//  MKFoundation
//
//  Created by Michal Konturek on 22/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSDate+MK_Creation.h"

@implementation NSDate (MK_Creation)

+ (NSDate *)dateWithoutTime {
    return [[NSDate date] dateAsDateWithoutTime];
}

+ (NSDate *)dateFromString:(NSString *)string {
    return [self dateFromString:string withFormat:[NSDate dateFormatYYYYMMDDDashed]];
}

+ (NSDate *)dateFromString:(NSString *)string withFormat:(NSString *)format {
    
    if ((NSNull *)string == [NSNull null] || string == nil) {
        return nil;
    }
    
    if (format == nil) {
        format = [NSDate dateFormatYYYYMMDDDashed];
    }
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    NSDate *result = [formatter dateFromString:string];
    
    return result;
}

- (NSDate *)dateAsDateWithoutTime {
    NSString *formattedString = [self formattedString];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:[NSDate dateFormatMMMDDYYYY]];
    NSDate *ret = [formatter dateFromString:formattedString];
    
    return ret;
}

@end
