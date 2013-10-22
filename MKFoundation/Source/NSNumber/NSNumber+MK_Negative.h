//
//  NSNumber+MK_Negative.h
//
//  Created by Michal Konturek on 02/07/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (MK_Negative)

+ (instancetype)minus_one;

- (instancetype)negative;
- (instancetype)positive;;

- (instancetype)negate;

- (BOOL)isPositive;
- (BOOL)isNegative;

@end
