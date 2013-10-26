//
//  NSString+MK_Base64.h
//  MKFoundation
//
//  Created by Michal Konturek on 26/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MK_Base64)

+ (NSString *)MK_stringWithBase64EncodedString:(NSString *)string;

- (NSString *)MK_base64DecodedString;
- (NSString *)MK_base64EncodedString;
- (NSString *)MK_base64EncodedStringWithWrapWidth:(NSUInteger)wrapWidth;
- (NSData *)MK_base64DecodedData;

@end
