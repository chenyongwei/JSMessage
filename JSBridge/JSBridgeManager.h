//
//  JSBridgeManager.h
//  WebViewService
//
//  Created by Yongwei.Chen on 1/4/15.
//  Copyright (c) 2015 DCF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JSBridgeManager : NSObject

+(id)sharedInstance;

-(BOOL)runMessage:(NSString *)msgStr forWebView:(UIWebView *)webView;

@end
