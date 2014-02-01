//
//  NSDictionary+MK_Misc.h
//  MKFoundationKit
//
//  Created by Michal Konturek on 11/07/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (MK_Misc)

- (NSMutableDictionary *)mk_dictionaryWithKeys:(NSArray *)keys;
- (NSMutableDictionary *)mk_renameKeysUsingMapping:(NSDictionary *)mapping;

- (BOOL)mk_isEmpty;

@end
