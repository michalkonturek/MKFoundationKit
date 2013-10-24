//
//  NSDate+MK_Formatting.m
//  MKFoundation
//
//  Created by Michal Konturek on 22/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSDate+MK_Formatting.h"

@implementation NSDate (MK_Formatting)

+ (NSString *)dateFormatCCCCDDMMMYYYY {
    return @"cccc, dd MMM yyyy";
}

+ (NSString *)dateFormatCCCCDDMMMMYYYY {
    return @"cccc, dd MMMM yyyy";
}

+ (NSString *)dateFormatDDMMYYYYSlashed {
    return @"dd/MM/YYYY";
}

+ (NSString *)dateFormatDDMMMYYYY {
    return @"dd MMM YYYY";
}

+ (NSString *)dateFormatDDMMMYYYYSlashed {
    return @"dd/MMM/YYYY";
}

+ (NSString *)dateFormatMMMDDYYYY {
    return @"MMM dd, yyyy";
}

+ (NSString *)dateFormatYYYYMMDDDashed {
    return @"yyyy-MM-dd";
}

- (NSString *)formattedString {
    return [self formattedStringUsingFormat:[NSDate dateFormatDDMMMYYYY]];
}

- (NSString *)formattedStringUsingFormat:(NSString *)dateFormat {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:dateFormat];
    NSString *result = [formatter stringFromDate:self];
    return result;
}

@end
