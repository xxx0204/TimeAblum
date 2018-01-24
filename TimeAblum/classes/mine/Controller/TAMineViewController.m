//
//  TAMineViewController.m
//  TimeAblum
//
//  Created by 陈哲是个好孩子 on 2018/1/21.
//  Copyright © 2018年 陈哲是个好孩子. All rights reserved.
//

#import "TAMineViewController.h"
#import "TAMineListCell.h"
#import "TAWebViewViewController.h"

@interface TAMineViewController ()

@end

@implementation TAMineViewController


#pragma mark **********************     视图控制器生命周期  **********************

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"我的";
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    TabbarShow
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark **********************        数据初始化      **********************

-(void)initializeData
{
    [super initializeData];
    self.dataArray = [NSMutableArray arrayWithArray:@[@"关于我们"]];
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

#pragma mark **********************         回调事件       ***********************

#pragma mark 回调事件 UITableView
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [TAMineListCell configTableView:tableView indexPath:indexPath dataArray:self.dataArray];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TAWebViewViewController * vc = [[TAWebViewViewController alloc] init];
    vc.urlString = @"http://www.baidu.com";
    vc.title = self.dataArray[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
