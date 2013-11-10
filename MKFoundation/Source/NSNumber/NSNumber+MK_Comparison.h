//
//  NSNumber+MK_Comparison.h
//  MKFoundationKit
//
//  Created by Michal Konturek on 06/07/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSNumber+MK.h"

@interface NSNumber (MK_Comparison)

+ (instancetype)MK_max:(NSArray *)numbers;

+ (instancetype)MK_min:(NSArray *)numbers;

- (instancetype)MK_max:(NSArray *)others;

- (instancetype)MK_min:(NSArray *)others;

- (BOOL)MK_isTheSame:(NSNumber *)other;

- (BOOL)MK_isGreaterThan:(NSNumber *)other;

- (BOOL)MK_isLessThan:(NSNumber *)other;

- (BOOL)MK_isEven;

- (BOOL)MK_isOdd;

@end
