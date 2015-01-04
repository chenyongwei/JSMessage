//
//  JSBridgeConstant.h
//  JSMessage
//
//  Created by Yongwei.Chen on 1/4/15.
//  Copyright (c) 2015 DCF. All rights reserved.
//

#define JSMessagePrefix @"qx://app/"
#define JSCallbackMethodTemplate @"javascript:window.qxAppCallback(\"%@\", \"%@\")" //qxAppCallback(callbackId, callbackValue)

#define SINGLETON \
+ (id)sharedInstance { \
static id state = nil; \
if (!state) { \
@synchronized(self) { \
if (!state) state = [[self alloc] init]; \
} \
} \
return state; \
}

#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)