//
//  MKLog.h
//  MKFoundation
//
//  Created by Michal Konturek on 11/07/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DLog(...)
#endif


#ifdef DEBUG
#   define FLog(fmt, ...) NSLog((@"[%@:%@:%d] " fmt), NSStringFromClass([self class]), NSStringFromSelector(_cmd), __LINE__, ##__VA_ARGS__);
#else
#   define FLog(...)
#endif


#ifdef DEBUG
#   define MLog(fmt, ...) NSLog((@"%@ [Line %d] " fmt), NSStringFromClass([self class]), __LINE__, ##__VA_ARGS__);
#else
#   define MLog(...)
#endif
