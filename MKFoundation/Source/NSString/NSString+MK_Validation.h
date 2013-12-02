//
//  NSString+MK_EmailValidation.h
//  MKFoundation
//
//  Created by Michal Konturek on 22/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MK_Validation)

+ (BOOL)mk_isStringValidEmail:(NSString *)email;

- (BOOL)mk_isValidEmail;

- (BOOL)mk_matchesRegex:(NSString *)regex;

@end
