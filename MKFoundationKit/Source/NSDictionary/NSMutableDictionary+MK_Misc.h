//
//  NSMutableDictionary+MK.h
//  MKFoundation
//
//  Created by Michal Konturek on 25/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (MK_Misc)

/**
 Safely adds object to the collection.
 It fails silenty if key or object is nil.
 */
- (void)mk_safeSetObject:(id)object forKey:(id)key;

@end
