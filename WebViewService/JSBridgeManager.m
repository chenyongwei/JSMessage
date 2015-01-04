//
//  JSBridgeManager.m
//  WebViewService
//
//  Created by Yongwei.Chen on 1/4/15.
//  Copyright (c) 2015 DCF. All rights reserved.
//

#import "JSBridgeManager.h"


@implementation JSBridgeManager
{
    NSMutableDictionary *serviceInstanceCache;
}

-(instancetype)init
{
    self = [super init];
    if (self) {
        serviceInstanceCache = [NSMutableDictionary dictionary];
    }
    return self;
}

SINGLETON

-(BOOL)runMessage:(NSString *)msgStr forWebView:(UIWebView *)webView
{
    JSMessage *msg = [self parseMessage:msgStr];

    NSString *aClassName = msg.service;
    id aInstance = [serviceInstanceCache objectForKey:aClassName];
    if (!aInstance) {
        Class aClass = NSClassFromString(aClassName);
        aInstance = [[aClass alloc] init];
        [serviceInstanceCache setObject:aInstance forKey:aClassName];
    }
    
    SEL aSel = [self selectorFromMessage:msg];

    if([aInstance respondsToSelector:aSel])
    {
        id result = [self performSelector:aSel onInstance:aInstance withMessage:msg];
        if (result) {
            NSString *jsCallback = [NSString stringWithFormat:JSCallbackMethodTemplate, msg.callbackId, (NSString *)result];
            [webView stringByEvaluatingJavaScriptFromString:jsCallback];
        }
        return YES;
    }
    return NO;
}

-(JSMessage *)parseMessage:(NSString *)msgStr
{
    NSData *msgData = [msgStr dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *msgDict = [NSJSONSerialization JSONObjectWithData:msgData options:NSJSONReadingAllowFragments error:nil];
    JSMessage *msg = [MTLJSONAdapter modelOfClass:[JSMessage class] fromJSONDictionary:msgDict error:nil];
    return msg;
}

-(SEL)selectorFromMessage:(JSMessage *)msg
{
    NSString *aMethodName = msg.action;
    NSString *paramsStr = msg.params;
    SEL aSel;
    if (paramsStr) {
        aSel = NSSelectorFromString([NSString stringWithFormat:@"%@:", aMethodName]);
    }
    else {
        aSel = NSSelectorFromString(aMethodName);
    }
    return aSel;
}

-(id)performSelector:(SEL)sel onInstance:(id)instance withMessage:(JSMessage *)msg
{
    NSString *paramsStr = msg.params;
    NSString *callbackIdStr = msg.callbackId;
    id result = nil;
    if (callbackIdStr) {
        SuppressPerformSelectorLeakWarning(
                                           if (paramsStr) {
                                               result = [instance performSelector:sel withObject:paramsStr];
                                           }
                                           else {
                                               result = [instance performSelector:sel];
                                           }
                                           );
    }
    else {
        SuppressPerformSelectorLeakWarning(
                                           if (paramsStr) {
                                               [instance performSelector:sel withObject:paramsStr];
                                           }
                                           else {
                                               [instance performSelector:sel];
                                           }
                                           );
    }
                                       
    return result;
}

@end
