//
//  NSData+MK_Base64.h
//  MKFoundation
//
//  Created by Michal Konturek on 26/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (MK_Base64)

+ (NSData *)mk_dataWithBase64EncodedString:(NSString *)string;

- (NSString *)mk_base64DecodedString;

- (NSString *)mk_base64EncodedString;

@end
