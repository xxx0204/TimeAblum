//
//  HHZViewController.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/16.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "HHZViewController.h"
#import <HHZUtils/HHZMethodException.h>

@interface HHZViewController ()

@end

@implementation HHZViewController

#pragma mark **********************     视图控制器生命周期  **********************

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self initializeData];
    [self createMainView];
    [self doSomeThingsBeforeShow];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark **********************        数据初始化      **********************

-(void)initializeData
{
    @throw [HHZMethodException exceptionWithClass:NSStringFromClass([self class]) Method:NSStringFromSelector(_cmd)];
}

#pragma mark **********************         视图创建      **********************

-(void)createMainView
{
    @throw [HHZMethodException exceptionWithClass:NSStringFromClass([self class]) Method:NSStringFromSelector(_cmd)];
}

#pragma mark **********************  属性以及视图创建后的基本操作  ******************

-(void)doSomeThingsBeforeShow
{
    
}

#pragma mark **********************         重写方法       ***********************

#pragma mark **********************        自定义方法       ***********************

#pragma mark **********************         触发事件       ***********************

-(void)back
{
    
}

#pragma mark **********************         回调事件       ***********************


@end
