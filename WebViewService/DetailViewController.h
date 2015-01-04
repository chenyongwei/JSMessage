//
//  DetailViewController.h
//  WebViewService
//
//  Created by Yongwei.Chen on 12/24/14.
//  Copyright (c) 2014 DCF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MTLJSONAdapter.h"
#import "JSMessage.h"
#import "JSService.h"


@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

