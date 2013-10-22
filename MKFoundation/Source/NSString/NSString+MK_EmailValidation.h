//
//  NSString+MK_EmailValidation.h
//  MKFoundation
//
//  Created by Michal Konturek on 22/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSString+MK.h"

@interface NSString (MK_EmailValidation)

+ (BOOL)isStringValidEmail:(NSString *)value;

- (BOOL)isValidEmail;

@end
