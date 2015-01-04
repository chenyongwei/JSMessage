//
//  NativeAlertController.m
//  WebViewService
//
//  Created by Yongwei.Chen on 1/4/15.
//  Copyright (c) 2015 DCF. All rights reserved.
//

#import "NativeAlertController.h"


@implementation NativeAlertController

-(void)show
{
    [[[UIAlertView alloc] initWithTitle:@"测试title"
                                message:@"测试message"
                               delegate:self
                      cancelButtonTitle:@"确认"
                      otherButtonTitles:nil] show];
}

@end
