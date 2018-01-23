//
//  TACreateAblumViewController.m
//  TimeAblum
//
//  Created by 陈哲是个好孩子 on 2018/1/23.
//  Copyright © 2018年 陈哲是个好孩子. All rights reserved.
//

#import "TACreateAblumViewController.h"
#import "TATabbarTool.h"

@interface TACreateAblumViewController ()

@end

@implementation TACreateAblumViewController

#pragma mark **********************     视图控制器生命周期  **********************

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"创建相册";
    BackFunction
    [[TATabbarTool shareManager].tabbar hideTabbarView:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark **********************        数据初始化      **********************

-(void)initializeData
{
    [super initializeData];
}

#pragma mark **********************         视图创建      **********************

-(void)createMainView
{
    [super createMainView];
}

#pragma mark **********************  属性以及视图创建后的基本操作  ******************

#pragma mark **********************         重写方法       ***********************

#pragma mark **********************        自定义方法       ***********************

#pragma mark **********************         触发事件       ***********************

-(void)back
{
    [super back];
}

#pragma mark **********************         回调事件       ***********************

@end
