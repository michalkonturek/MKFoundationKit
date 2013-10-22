//
//  NSNumber+MK_Precision.h
//
//  Created by Michal Konturek on 02/07/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (MK_Precision)

+ (NSDecimalNumberHandler *)decimalNumberHandlerWithScale:(short)scale;

- (instancetype)roundedAsMoney;
- (instancetype)roundedWithPrecision:(short)precision;

@end
