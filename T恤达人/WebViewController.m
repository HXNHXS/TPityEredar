//
//  WebViewController.m
//  TPityEredar
//
//  Created by Mac on 15-7-29.
//  Copyright (c) 2015年 刘 朋飞. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = self.object.title;
    
    UIWebView *webview = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.object.taobaoUrl]];
    [webview loadRequest:request];
    [self.view addSubview:webview];
    [webview reload];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
