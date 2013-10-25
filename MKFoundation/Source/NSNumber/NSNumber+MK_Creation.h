//
//  NSNumber+MK_Creation.h
//  MKFoundationKit
//
//  Created by Michal Konturek on 02/07/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (MK_Creation)

+ (instancetype)MK_createFrom:(NSNumber *)number;

- (NSDecimalNumber *)MK_decimalNumber;

@end
