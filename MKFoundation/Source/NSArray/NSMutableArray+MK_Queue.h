//
//  NSMutableArray+MK_Queue.h
//  MKFoundation
//
//  Created by Michal Konturek on 14/11/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#import "NSArray+MK.h"

@interface NSMutableArray (MK_Queue)

- (void)MK_enqueueObject:(id)object;
- (id)MK_dequeueObject;

@end
