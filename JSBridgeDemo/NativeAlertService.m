//
//  NativeAlertService.m
//  WebViewService
//
//  Created by Yongwei.Chen on 1/4/15.
//  Copyright (c) 2015 DCF. All rights reserved.
//

#import "NativeAlertService.h"

@implementation NativeAlertService

-(void)show:(id)params
{
    NSString *msg = @"";
    if (params) {
        msg = params;
    }
    [[[UIAlertView alloc] initWithTitle:@"测试title"
                                message:msg
                               delegate:self
                      cancelButtonTitle:@"确认"
                      otherButtonTitles:nil] show];
}

-(id)hide
{
    return @"hided!";
}

@end
