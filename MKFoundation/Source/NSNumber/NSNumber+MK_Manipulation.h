//
//  NSNumber+MK_Manipulation.h
//  MKFoundationKit
//
//  Created by Michal Konturek on 02/07/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (MK_Manipulation)

- (instancetype)add:(NSNumber *)other;
- (instancetype)subtract:(NSNumber *)other;
- (instancetype)multiplyBy:(NSNumber *)other;
- (instancetype)divideBy:(NSNumber *)other;

- (instancetype)raiseToPower:(NSInteger)power;

@end
