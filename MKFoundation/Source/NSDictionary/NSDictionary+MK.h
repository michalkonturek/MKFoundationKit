//
//  NSDictionary+MK.h
//  MKFoundationKit
//
//  Created by Michal Konturek on 11/07/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (MK)

- (NSMutableDictionary *)renameKeysUsingMapping:(NSDictionary *)mapping;
- (NSMutableDictionary *)dictionaryWithKeys:(NSArray *)keys;

@end
