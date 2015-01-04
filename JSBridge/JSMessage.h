//
//  JSMessage.h
//  WebViewService
//
//  Created by Yongwei.Chen on 1/4/15.
//  Copyright (c) 2015 DCF. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MTLModel.h"
#import "MTLJSONAdapter.h"

@interface JSMessage : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSString *service;
@property (nonatomic, strong) NSString *action;
@property (nonatomic, strong) NSString *params;
@property (nonatomic, strong) NSString *callbackId;

@end
