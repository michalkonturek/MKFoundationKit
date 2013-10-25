//
//  NSDictionary+MK.h
//  MKFoundationKit
//
//  Created by Michal Konturek on 11/07/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NSMutableDictionary+MK.h"

@interface NSDictionary (MK)

- (NSMutableDictionary *)MK_dictionaryWithKeys:(NSArray *)keys;
- (NSMutableDictionary *)MK_renameKeysUsingMapping:(NSDictionary *)mapping;

- (BOOL)MK_isEmpty;

@end
