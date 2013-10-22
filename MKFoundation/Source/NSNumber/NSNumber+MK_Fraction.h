//
//  NSNumber+MK_Fraction.h
//
//  Created by Michal Konturek on 30/06/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (MK_Fraction)

- (instancetype)integralPart;
- (instancetype)fractionalPart;

- (BOOL)isInteger;
- (BOOL)isFraction;

@end
