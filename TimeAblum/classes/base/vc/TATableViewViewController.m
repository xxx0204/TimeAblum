//
//  TATableViewViewController.m
//  TimeAblum
//
//  Created by 陈哲是个好孩子 on 2018/1/21.
//  Copyright © 2018年 陈哲是个好孩子. All rights reserved.
//

#import "TATableViewViewController.h"

@interface TATableViewViewController ()

@end

@implementation TATableViewViewController

#pragma mark 视图控制器生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark 数据初始化
-(void)initializeData
{
    [super initializeData];
    self.page = 1;
    self.num = 20;
}

#pragma mark 视图创建
-(void)createMainView
{
    [super createMainView];
    [self.view addSubview:self.tableView];
}

#pragma mark 属性以及视图创建后的基本操作
-(void)doSomeThingsBeforeShow
{
    
}

-(UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc] init];
        _tableView.frame = CGRectMake(0, 0, SCREENW, SCREENH - 64);
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor grayColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

#pragma mark 重写方法或协议方法
-(void)handleNoneDataView
{
    if (CGRectIsEmpty(self.noneDataView.frame))
    {
        self.noneDataView.frame = self.tableView.bounds;
        [self.tableView addSubview:self.noneDataView];
        [self.tableView bringSubviewToFront:self.noneDataView];
    }
}

#pragma mark 自定义方法
-(void)endMJRefresh
{
    [self.tableView.mj_header endRefreshing];
    [self.tableView.mj_footer endRefreshing];
}

#pragma mark 触发事件


#pragma mark 回调事件

@end
