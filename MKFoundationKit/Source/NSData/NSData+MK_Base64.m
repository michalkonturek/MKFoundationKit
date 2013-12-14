//
//  NSData+MK_Base64.m
//  MKFoundation
//
//  Created by Michal Konturek on 26/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSData+MK_Base64.h"

@implementation NSData (MK_Base64)

+ (NSData *)mk_dataWithBase64EncodedString:(NSString *)string {
    return [[NSData alloc] initWithBase64EncodedString:string options:0];
}

- (NSString *)mk_base64DecodedString {
    return [[NSString alloc] initWithData:self encoding:NSUTF8StringEncoding];
}

- (NSString *)mk_base64EncodedString {
    return  [self base64EncodedStringWithOptions:0];
}

@end
