//
//  NSArray+MK_Misc.h
//  MKFoundation
//
//  Created by Michal Konturek on 10/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (MK_Misc)

/*
 NOTE: 
    Since iOS 4 firstObject has been available as private API.
    It has been publicly available since iOS 7.
 */
- (id)mk_firstObject;

- (id)mk_max;

- (id)mk_min;

- (BOOL)mk_isEmpty;

@end
