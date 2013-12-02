//
//  NSString+MK_Empty.h
//  MKFoundation
//
//  Created by Michal Konturek on 23/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MK_Empty)

+ (BOOL)mk_isStringEmptyOrNil:(NSString *)value;

- (BOOL)mk_isEmpty;
- (NSString *)mk_trimmedString;

@end
