//
//  TATableViewViewController.h
//  TimeAblum
//
//  Created by 陈哲是个好孩子 on 2018/1/21.
//  Copyright © 2018年 陈哲是个好孩子. All rights reserved.
//

#import "TAViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface TATableViewViewController : TAViewController<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView * tableView;
//数据源数组
@property (nonatomic, strong) NSMutableArray * dataArray;

#pragma mark 分页
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, assign) NSInteger num;

-(void)endMJRefresh;
@end

NS_ASSUME_NONNULL_END
