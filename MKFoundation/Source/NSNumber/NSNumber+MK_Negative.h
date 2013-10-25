//
//  NSNumber+MK_Negative.h
//  MKFoundationKit
//
//  Created by Michal Konturek on 02/07/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (MK_Negative)

+ (instancetype)MK_minus_one;

- (instancetype)MK_negative;
- (instancetype)MK_positive;;

- (instancetype)MK_negate;

- (BOOL)MK_isPositive;
- (BOOL)MK_isNegative;

@end
