//
//  NativeAlertService.h
//  WebViewService
//
//  Created by Yongwei.Chen on 1/4/15.
//  Copyright (c) 2015 DCF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSService.h"

@interface NativeAlertService : JSService

-(void)show:(id)params;
-(id)hide;

@end
