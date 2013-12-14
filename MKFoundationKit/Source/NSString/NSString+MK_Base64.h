//
//  NSString+MK_Base64.h
//  MKFoundation
//
//  Created by Michal Konturek on 26/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MK_Base64)

- (NSString *)mk_base64DecodedString;
- (NSString *)mk_base64EncodedString;

- (NSData *)mk_base64DecodedData;
- (NSData *)mk_base64EncodedData;

@end
