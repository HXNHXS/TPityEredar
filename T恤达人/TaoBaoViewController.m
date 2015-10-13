//
//  TaoBaoViewController.m
//  TPityEredar
//
//  Created by mac on 15-7-30.
//  Copyright (c) 2015年 刘 朋飞. All rights reserved.
//

#import "TaoBaoViewController.h"

@interface TaoBaoViewController ()

@end

@implementation TaoBaoViewController

#pragma mark - taobaoWebView
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = self.typeHot.title;
    
    UIWebView *webView = [[UIWebView alloc] init];
    webView.frame = CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:webView];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.typeHot.taobaoUrl]];
    [webView loadRequest:request];

}
#pragma mark - webView
- (void) creatWebView{
//TODO:taobaoWebView
    UIWebView *webView = [[UIWebView alloc] init];
    webView.frame = self.view.bounds;
    NSURL *url =  [NSURL URLWithString:@"http://www.taobao.com/"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    
    [self.view addSubview:webView];
}
@end
