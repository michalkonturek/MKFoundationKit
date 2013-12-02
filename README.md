# MKFoundation

[![License MIT](https://go-shields.herokuapp.com/license-MIT-blue.png)](https://github.com/michalkonturek/MKFoundation/blob/master/LICENSE)
[![Build Platform](https://cocoapod-badges.herokuapp.com/p/MKFoundation/badge.png)](https://github.com/michalkonturek/MKFoundation)
[![Build Version](https://cocoapod-badges.herokuapp.com/v/MKFoundation/badge.png)](https://github.com/michalkonturek/MKFoundation)
[![Build Status](https://travis-ci.org/michalkonturek/MKFoundation.png?branch=master)](https://travis-ci.org/michalkonturek/MKFoundation)


MKFoundation is a collection of categories for `NSFoundation` classes to accelerate development. 

## Overview

## NSArray

### NSArray+MK_Block

```objc
- (void)mk_apply:(MKItemBlock)block;

- (void)mk_each:(MKItemBlock)block;

- (instancetype)mk_map:(LINQSelectorBlock)selectorBlock;

- (id)mk_match:(LINQConditionBlock)conditionBlock;

- (id)mk_reduce:(id)initial withBlock:(LINQAccumulatorBlock)accumulatorBlock;

- (instancetype)mk_reject:(LINQConditionBlock)conditionBlock;

- (instancetype)mk_select:(LINQConditionBlock)conditionBlock;

- (BOOL)mk_all:(LINQConditionBlock)conditionBlock;

- (BOOL)mk_any:(LINQConditionBlock)conditionBlock;

- (BOOL)mk_none:(LINQConditionBlock)conditionBlock;
```

### NSArray+MK_Misc

```objc
- (id)mk_firstObject;
```

### NSMutableArray+MK_Misc

```objc
- (void)mk_safeAddObject:(id)object;
```

### NSMutableArray+MK_Queue

```objc
- (void)mk_enqueueObject:(id)object;
- (id)mk_dequeueObject;
```

### NSMutableArray+MK_Stack

```objc
- (void)mk_pushObject:(id)object;
- (id)mk_pullObject;
```

## NSData

### NSData+MK_Base64

## NSDate

### NSDate+MK_Comparison

### NSDate+MK_Components

### NSDate+MK_Creation

### NSDate+MK_Formatting

### NSDate+MK_Manipulation

<!--## NSDecimalNumber-->

## NSDictionary

### NSDictionary+MK_Block

### NSDictionary+MK_Misc

### NSMutableDictionary+MK_Misc

## NSNumber

### NSNumber+MK_Comparison

### NSNumber+MK_Creation

### NSNumber+MK_Fraction

### NSNumber+MK_Manipulation

### NSNumber+MK_Negative

### NSNumber+MK_Precison

## NSObject

### NSObject+MK_AutoDescribe

## NSSet

### NSSet+MK_Block

## NSString

### NSString+MK_Base64

### NSString+MK_Conversion

### NSString+MK_Empty

### NSString+MK_Misc

### NSString+MK_UTF

### NSString+MK_UUID

### NSString+MK_Validation


- - - 

[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/michalkonturek/mkfoundation/trend.png)](https://bitdeli.com/free "Bitdeli Badge")




