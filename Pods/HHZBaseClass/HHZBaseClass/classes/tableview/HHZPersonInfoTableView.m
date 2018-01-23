//
//  HHZPersonInfoTableView.m
//  HHZBaseClass
//
//  Created by 仁和Mac on 2017/9/29.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import "HHZPersonInfoTableView.h"

typedef NS_ENUM(NSUInteger,HHZPersonInfoCommonCellDataType) {
    HHZPersonInfoCommonCellDataTypeType1, //一元数组
    HHZPersonInfoCommonCellDataTypeType2  //二元数组
};

@interface HHZPersonInfoTableView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, assign) HHZPersonInfoCommonCellDataType dataType;
@property (nonatomic, assign) HHZPersonInfoCommonCellType cellType;
@property (nonatomic, assign) id<HHZPersonInfoTableViewDelegate> delegate;
@end

@implementation HHZPersonInfoTableView

-(UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc] initWithFrame:self.bounds];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

-(void)setDataArray:(NSMutableArray<HHZPersonInfoCommonCellModel *> *)dataArray
{
    _dataArray = dataArray;
    if (_dataArray.count > 0)
    {
        if ([_dataArray[0] isKindOfClass:[NSArray class]]) _dataType = HHZPersonInfoCommonCellDataTypeType2;
        else _dataType = HHZPersonInfoCommonCellDataTypeType1;
    }
    else
    {
        _dataType = HHZPersonInfoCommonCellDataTypeType1;
    }
}

-(void)configCellType:(HHZPersonInfoCommonCellType)cellType delegate:(id<HHZPersonInfoTableViewDelegate>)delegate
{
    _cellType = cellType;
    _delegate = delegate;
    if (!self.tableView.superview) [self addSubview:self.tableView];
}


#pragma mark UITableView回调
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    switch (_dataType)
    {
        case HHZPersonInfoCommonCellDataTypeType1:
            return 1;
            break;
        case HHZPersonInfoCommonCellDataTypeType2:
            return self.dataArray.count;
            break;
        default:
            return 1;
            break;
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (_dataType)
    {
        case HHZPersonInfoCommonCellDataTypeType1:
            return self.dataArray.count;
            break;
        case HHZPersonInfoCommonCellDataTypeType2:
            return ((NSArray *)self.dataArray[section]).count;
            break;
        default:
            return 1;
            break;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [HHZPersonInfoCommonCell configCellWithTableView:tableView indexPath:indexPath dataArray:self.dataArray];
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01f;
}

@end
