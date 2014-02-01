//
//  NSString+MK_Base64.m
//  MKFoundation
//
//  Created by Michal Konturek on 26/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSString+MK_Base64.h"

#import "NSData+MK_Base64.h"

@implementation NSString (MK_Base64)

- (NSString *)mk_base64DecodedString {
    NSData *data = [self mk_base64DecodedData];
    return [data mk_base64DecodedString];
}

- (NSString *)mk_base64EncodedString {
    if ([self length] == 0) return nil;
    
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    return [data base64EncodedStringWithOptions:0];
}

- (NSData *)mk_base64DecodedData {
    return [[NSData alloc] initWithBase64EncodedString:self options:0];
}

- (NSData *)mk_base64EncodedData {
    return [self dataUsingEncoding:NSUTF8StringEncoding];
}

@end
