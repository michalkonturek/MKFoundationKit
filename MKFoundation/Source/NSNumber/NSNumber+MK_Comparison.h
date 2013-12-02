//
//  NSNumber+MK_Comparison.h
//  MKFoundationKit
//
//  Created by Michal Konturek on 06/07/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSNumber+MK.h"

@interface NSNumber (MK_Comparison)

+ (instancetype)mk_max:(NSArray *)numbers;

+ (instancetype)mk_min:(NSArray *)numbers;

- (instancetype)mk_max:(NSArray *)others;

- (instancetype)mk_min:(NSArray *)others;

- (BOOL)mk_isTheSame:(NSNumber *)other;

- (BOOL)mk_isGreaterThan:(NSNumber *)other;

- (BOOL)mk_isLessThan:(NSNumber *)other;

- (BOOL)mk_isEven;

- (BOOL)mk_isOdd;

@end
