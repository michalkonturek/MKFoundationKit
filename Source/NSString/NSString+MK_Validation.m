//
//  NSString+MK_EmailValidation.m
//  MKFoundation
//
//  Created by Michal Konturek on 22/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSString+MK_Validation.h"

@implementation NSString (MK_Validation)

+ (BOOL)mk_isStringValidEmail:(NSString *)email {
    /*
     Source:        http://stackoverflow.com/questions/3139619/check-that-an-email-address-is-valid-on-ios
     Discussion:    http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
     */
    BOOL stricterFilter = YES;
    NSString *stricterFilterString = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSString *laxString = @".+@.+\\.[A-Za-z]{2}[A-Za-z]*";
    NSString *regex = stricterFilter ? stricterFilterString : laxString;
//    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
//    return [emailTest evaluateWithObject:email];
    return [email mk_matchesRegex:regex];
}

- (BOOL)mk_isValidEmail {
    return [[self class] mk_isStringValidEmail:self];
}

- (BOOL)mk_matchesRegex:(NSString *)regex {
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [emailTest evaluateWithObject:self];
}

@end
