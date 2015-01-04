//
//  DetailViewController.m
//  WebViewService
//
//  Created by Yongwei.Chen on 12/24/14.
//  Copyright (c) 2014 DCF. All rights reserved.
//

#import "DetailViewController.h"
#import "Constant.h"
#import "NSString+PJR.h"
#import "JSBridgeManager.h"

@interface DetailViewController () <UIWebViewDelegate>

@end

@implementation DetailViewController {
    UIWebView *webViewContainer;
}

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
//    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
//
        // Update the view.
        [self configureView];
//    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
    if (!webViewContainer) {
        webViewContainer = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, Main_Screen_Width, Main_Screen_Height)];
        webViewContainer.delegate = self;
        webViewContainer.scalesPageToFit = YES;
        [self.view addSubview:webViewContainer];
    }
    NSString *urlStr = [NSString stringWithFormat:@"%@%@", JSMessagePrefix, [self.detailItem stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    if (urlStr) {
        [webViewContainer loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]]];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self configureView];
}

#pragma mark - UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *urlStr = [request.URL absoluteString];
    NSString *msgStr = [[urlStr replaceCharcter:JSMessagePrefix withCharcter:@""] stringByRemovingPercentEncoding];
    return ![[JSBridgeManager sharedInstance] runMessage:msgStr forWebView:webView];
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
