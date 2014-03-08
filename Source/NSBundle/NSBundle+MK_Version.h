//
//  NSBundle+MK_Version.h
//  MKFoundationKit
//
//  Created by Michal Konturek on 07/03/2014.
//  Copyright (c) 2014 Michal Konturek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSBundle (MK_Version)

- (NSString *)mk_build;

- (NSString *)mk_name;

- (NSString *)mk_version;

- (NSString *)mk_infoForKey:(id)key;

@end
