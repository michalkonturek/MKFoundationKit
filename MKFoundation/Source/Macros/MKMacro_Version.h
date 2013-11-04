//
//  MKMacro_Version.h
//  MKFoundation
//
//  Created by Michal Konturek on 28/10/2013.
//  Copyright (c) 2013 Michal Konturek. All rights reserved.
//

#define IOS_VERSION_EQUAL_TO(v)                     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define IOS_VERSION_GREATER_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define IOS_VERSION_GREATER_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define IOS_VERSION_LESS_THAN(v)                    ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define IOS_VERSION_LESS_THAN_OR_EQUAL_TO(v)        ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

//#define IOS_VERSION_COMPARE(v, o)               ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != o)
