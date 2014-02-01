//
//  NSDate+MK_Formatting.h
//  MKFoundation
//
//  Created by Michal Konturek on 22/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (MK_Formatting)

+ (NSString *)mk_dateFormatCCCCDDMMMYYYY;
+ (NSString *)mk_dateFormatCCCCDDMMMMYYYY;

+ (NSString *)mk_dateFormatDDMMMYYYY;
+ (NSString *)mk_dateFormatDDMMYYYYDashed;
+ (NSString *)mk_dateFormatDDMMYYYYSlashed;

+ (NSString *)mk_dateFormatDDMMMYYYYSlashed;
+ (NSString *)mk_dateFormatMMMDDYYYY;
+ (NSString *)mk_dateFormatYYYYMMDDDashed;

- (NSString *)mk_formattedString;
- (NSString *)mk_formattedStringUsingFormat:(NSString *)dateFormat;

@end
