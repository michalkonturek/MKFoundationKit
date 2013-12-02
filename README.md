# MKFoundationKit

[![License MIT](https://go-shields.herokuapp.com/license-MIT-blue.png)](https://github.com/michalkonturek/MKFoundationKit/blob/master/LICENSE)
[![Build Platform](https://cocoapod-badges.herokuapp.com/p/MKFoundationKit/badge.png)](https://github.com/michalkonturek/MKFoundationKit)
[![Build Version](https://cocoapod-badges.herokuapp.com/v/MKFoundationKit/badge.png)](https://github.com/michalkonturek/MKFoundationKit)
[![Build Status](https://travis-ci.org/michalkonturek/MKFoundationKit.png?branch=master)](https://travis-ci.org/michalkonturek/MKFoundationKit)


MKFoundationKit is a collection of categories for `NSFoundation` classes to accelerate development. 

## Intro

<!--This library is available through [CocoaPods][PODS].-->

## License

Source code of this project is available under the standard MIT license. Please see [the license file][LICENSE].

[PODS]:http://cocoapods.org/
[LICENSE]:https://github.com/michalkonturek/MKFoundation/blob/master/LICENSE


# API

* [NSArray](#NSArray)
* [NSData](#NSData)
* [NSDate](#NSDate)
* [NSDictionary](#NSDictionary)
* [NSNumber](#NSNumber)
* [NSObject](#NSObject)
* [NSSet](#NSSet)
* [NSString](#NSString)


## NSArray Additions

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

## NSData Additions

### NSData+MK_Base64

```objc
```

## NSDate Additions

### NSDate+MK_Comparison

```objc
```

### NSDate+MK_Components

```objc
```

### NSDate+MK_Creation

```objc
```

### NSDate+MK_Formatting

```objc
```

### NSDate+MK_Manipulation

```objc
```

<!--## NSDecimalNumber-->

## NSDictionary

### NSDictionary+MK_Block

```objc
```

### NSDictionary+MK_Misc

```objc
```

### NSMutableDictionary+MK_Misc

```objc
```

## NSNumber

### NSNumber+MK_Comparison

```objc
```

### NSNumber+MK_Creation

```objc
```

### NSNumber+MK_Fraction

```objc
```

### NSNumber+MK_Manipulation

```objc
```

### NSNumber+MK_Negative

```objc
```

### NSNumber+MK_Precison

```objc
```

## NSObject

### NSObject+MK_AutoDescribe

```objc
```

## NSSet

### NSSet+MK_Block

```objc
```

## NSString

### NSString+MK_Base64

```objc
```

### NSString+MK_Conversion

```objc
```

### NSString+MK_Empty

```objc
```

### NSString+MK_Misc

```objc
```

### NSString+MK_UTF

```objc
```

### NSString+MK_UUID

```objc
```

### NSString+MK_Validation

```objc
```

- - - 

[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/michalkonturek/mkfoundationkit/trend.png)](https://bitdeli.com/free "Bitdeli Badge")



