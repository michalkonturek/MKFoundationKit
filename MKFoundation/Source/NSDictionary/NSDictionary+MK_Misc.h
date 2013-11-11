//
//  NSDictionary+MK_Misc.h
//  MKFoundationKit
//
//  Created by Michal Konturek on 11/07/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSDictionary+MK.h"

@interface NSDictionary (MK_Misc)

- (NSMutableDictionary *)MK_dictionaryWithKeys:(NSArray *)keys;
- (NSMutableDictionary *)MK_renameKeysUsingMapping:(NSDictionary *)mapping;

- (BOOL)MK_isEmpty;

@end
