//
//  NSString+MK_Base64.m
//  MKFoundation
//
//  Created by Michal Konturek on 26/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSString+MK_Base64.h"

#import "NSData+MK_Base64.h"
#import "NSString+MK_Empty.h"

@implementation NSString (MK_Base64)

//+ (NSString *)mk_stringWithBase64EncodedString:(NSString *)string {
//    NSData *data = [NSData mk_dataWithBase64EncodedString:string];
//    if (!data) return nil;
//    
//    return [[self alloc] initWithData:data encoding:NSUTF8StringEncoding];
//}

- (NSString *)mk_base64DecodedString {
//    return [NSString mk_stringWithBase64EncodedString:self];
    NSData *data = [self mk_base64DecodedData];
    return [data mk_base64DecodedString];
}

- (NSString *)mk_base64EncodedString {
//    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
//    return [data mk_base64EncodedString];
    
    if ([self length] == 0) return nil;
    
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    return [data base64EncodedStringWithOptions:0];
    
//    NSData *dataEncoded = [data base64EncodedDataWithOptions:0];
//    return [[NSString alloc] initWithData:dataEncoded encoding:NSUTF8StringEncoding];
}

//- (NSString *)mk_base64EncodedStringWithWrapWidth:(NSUInteger)wrapWidth {
//    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
//    return [data mk_base64EncodedStringWithWrapWidth:wrapWidth];
//}

- (NSData *)mk_base64DecodedData {
    return [[NSData alloc] initWithBase64EncodedString:self options:0];

//    return [NSData mk_dataWithBase64EncodedString:self];
}

- (NSData *)mk_base64EncodedData {
    return [self dataUsingEncoding:NSUTF8StringEncoding];
}

@end
