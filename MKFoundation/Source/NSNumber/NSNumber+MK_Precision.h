//
//  NSNumber+MK_Precision.h
//  MKFoundationKit
//
//  Created by Michal Konturek on 02/07/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (MK_Precision)

+ (NSDecimalNumberHandler *)MK_decimalNumberHandlerWithScale:(short)scale;

- (instancetype)MK_roundedAsMoney;
- (instancetype)MK_roundedWithPrecision:(short)precision;

@end
