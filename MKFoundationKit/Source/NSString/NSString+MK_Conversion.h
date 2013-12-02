//
//  NSString+MK_Conversion.h
//  MKFoundation
//
//  Created by Michal Konturek on 22/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MK_Conversion)

- (NSNumber *)mk_numberWithInteger;
- (NSNumber *)mk_numberWithLongLong;

@end
