//
//  NSString+MK.m
//  MKFlatUIKit
//
//  Created by Michal Konturek on 11/07/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSString+MK.h"

@implementation NSString (MK)

+ (BOOL)isStringEmptyOrNil:(NSString *)value {
    if (value == nil) return YES;
    return [value isEmpty];
}

+ (BOOL)isStringValidEmail:(NSString *)value {
    /*
     Source:        http://stackoverflow.com/questions/3139619/check-that-an-email-address-is-valid-on-ios
     Discussion:    http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
     */
    BOOL stricterFilter = YES;
    NSString *stricterFilterString = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSString *laxString = @".+@.+\\.[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:value];
}

+ (NSString *)decodeUTFString:(NSString *)value {
    return [value decodeUTF];
}


- (NSNumber *)numberWithInteger {
    @try {
        return [NSNumber numberWithInteger:[self integerValue]];
    }
    @catch (NSException *exception) {
        return nil;
    }
}

- (NSNumber *)numberWithLongLong {
    @try {
        return [NSNumber numberWithLongLong:[self longLongValue]];
    }
    @catch (NSException *exception) {
        return nil;
    }
}

- (NSString *)decodeUTF {
    
    // based on: http://stackoverflow.com/questions/4913499/utf8-character-decoding-in-objective-c
    return [NSString stringWithCString:[self cStringUsingEncoding:NSISOLatin1StringEncoding] encoding:NSUTF8StringEncoding];
    
//    self = [[self class] decodeUTFString:self];
//    return self;
}

- (BOOL)isValidEmail {
    return [[self class] isStringValidEmail:self];
}

- (BOOL)isEmpty {
    return ([allTrim(self) length] == 0) ? YES : NO;
}

@end
