//
//  HHZWebViewController.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/12/7.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "HHZWebViewController.h"

@implementation HHZWebViewController

#pragma mark **********************     视图控制器生命周期  **********************

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self createWebView];
    [self loadWebRequest];
}

-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark **********************        数据初始化      **********************

#pragma mark **********************         视图创建      **********************

-(void)createWebView
{
    self.webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    self.webView.delegate = self;
    [self.view addSubview:self.webView];
}


#pragma mark **********************  属性以及视图创建后的基本操作  ******************

-(UIActivityIndicatorView *)activityView
{
    if (!_activityView)
    {
        _activityView = [[UIActivityIndicatorView alloc] init];
        _activityView.center = self.webView.center;
        _activityView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
        [self.webView addSubview:_activityView];
    }
    return _activityView;
}

#pragma mark **********************         重写方法       ***********************

#pragma mark **********************        自定义方法       ***********************

-(void)loadWebRequest
{
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_urlString]]];
}

-(void)generateCookieName:(NSString *)cookieName Value:(NSString *)cookieValue Domain:(NSString *)cookieDomain Path:(NSString *)cookiePath Expires:(NSTimeInterval)expires
{
    NSMutableDictionary * cookiePropertie = [NSMutableDictionary dictionary];
    [cookiePropertie setObject:cookieName forKey:NSHTTPCookieName];
    [cookiePropertie setObject:cookieValue forKey:NSHTTPCookieValue];
    [cookiePropertie setObject:cookieDomain forKey:NSHTTPCookieDomain];
    [cookiePropertie setObject:cookiePath forKey:NSHTTPCookiePath];
    [cookiePropertie setObject:[[NSDate date] dateByAddingTimeInterval:expires] forKey:NSHTTPCookieExpires];
    NSHTTPCookie * cookie = [NSHTTPCookie cookieWithProperties:cookiePropertie];
    [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie];
}

#pragma mark **********************         触发事件       ***********************

#pragma mark **********************         回调事件       ***********************

#pragma mark 回调事件  UIWebViewDelegate
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    if (self.activityView) [self.activityView startAnimating];
    return YES;
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    if (self.activityView) [self.activityView stopAnimating];
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    if (self.activityView) [self.activityView stopAnimating];
}

@end
