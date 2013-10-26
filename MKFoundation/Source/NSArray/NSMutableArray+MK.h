//
//  NSMutableArray+MK
//  MKFoundation
//
//  Created by Michal Konturek on 25/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (MK)

/**
 Safely adds object to the collection.
 It fails silenty if object is nil.
 */
- (void)MK_safeAddObject:(id)object;

@end