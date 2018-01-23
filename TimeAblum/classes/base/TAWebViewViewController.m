//
//  TAWebViewViewController.m
//  TimeAblum
//
//  Created by 陈哲是个好孩子 on 2018/1/21.
//  Copyright © 2018年 陈哲是个好孩子. All rights reserved.
//

#import "TAWebViewViewController.h"
#import "TATabbarTool.h"
#import "TANavigationViewGenerator.h"

@interface TAWebViewViewController ()

@end

@implementation TAWebViewViewController

#pragma mark 视图控制器生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[TATabbarTool shareManager].tabbar hideTabbarView:YES];
    [TANavigationViewGenerator createNaviType:HHZNavigationViewGeneratorLeft Title:nil nolmalImage:[UIImage imageNamed:@"back_white"] selectedImage:nil andNavi:self andSEL:@selector(back)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark 数据初始化

#pragma mark 视图创建


#pragma mark 自定义辅助方法


#pragma mark 触发事件
-(void)back
{
    if ([self.webView canGoBack])
    {
        [self.webView goBack];
    }
    else
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}

#pragma mark 回调事件

@end
