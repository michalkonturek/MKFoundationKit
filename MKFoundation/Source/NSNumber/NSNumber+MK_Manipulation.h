//
//  NSNumber+MK_Manipulation.h
//  MKFoundationKit
//
//  Created by Michal Konturek on 02/07/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (MK_Manipulation)

- (instancetype)MK_add:(NSNumber *)other;
- (instancetype)MK_subtract:(NSNumber *)other;
- (instancetype)MK_multiplyBy:(NSNumber *)other;
- (instancetype)MK_divideBy:(NSNumber *)other;

- (instancetype)MK_raiseToPower:(NSInteger)power;

@end
