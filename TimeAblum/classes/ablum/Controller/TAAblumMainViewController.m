//
//  TAAblumMainViewController.m
//  TimeAblum
//
//  Created by 陈哲是个好孩子 on 2018/1/21.
//  Copyright © 2018年 陈哲是个好孩子. All rights reserved.
//

#import "TAAblumMainViewController.h"

@interface TAAblumMainViewController ()
@property (nonatomic, strong) HHZHttpResult * configResult;
@end

@implementation TAAblumMainViewController

#pragma mark **********************     视图控制器生命周期  **********************

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"相册";
    self.configResult = [self.currentService configCondition:nil];
    [self showNoData];
    
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
    self.tableView.frame = CGRectMake(0, 0, SCREENW, SCREENH - [[TATabbarTool shareManager] getTabbarHeight] - 64);
}

#pragma mark **********************  属性以及视图创建后的基本操作  ******************

#pragma mark **********************         重写方法       ***********************

/**
 重写无数据视图方法
 */
-(void)handleNoneDataView
{
    if (CGRectIsEmpty(self.noneDataView.frame))
    {
        self.noneDataView.frame = self.tableView.bounds;
        [self.tableView addSubview:self.noneDataView];
    }
}

#pragma mark **********************        自定义方法       ***********************


/**
 显示无相片视图
 */
-(void)showNoData
{
    [super showNoData];
    [self.noneDataView showAblumNoImages];
}


#pragma mark **********************         触发事件       ***********************

#pragma mark **********************         回调事件       ***********************

#pragma mark 回调事件 - UITableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

#pragma mark 回调事件 - 网络请求

-(void)requestSuccess:(HHZHttpResponse *)response
{
    if (response.tag == self.configResult.tag)
    {
        NSLog(@"cc11");
    }
}

-(void)requestFail:(HHZHttpResponse *)response
{
    if (response.tag == self.configResult.tag)
    {
        [self.currentService handleFailInfo:response];
    }
}

@end
