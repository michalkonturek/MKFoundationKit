//
//  NSNumber+MK_Comparison.h
//  MKFinancialKit
//
//  Created by Michal Konturek on 06/07/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (MK_Comparison)

+ (instancetype)max:(NSArray *)numbers;

+ (instancetype)min:(NSArray *)numbers;

- (instancetype)max:(NSArray *)others;

- (instancetype)min:(NSArray *)others;

- (BOOL)isTheSame:(NSNumber *)other;

- (BOOL)isGreaterThan:(NSNumber *)other;

- (BOOL)isLessThan:(NSNumber *)other;

@end
