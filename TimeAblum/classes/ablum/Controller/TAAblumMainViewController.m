//
//  TAAblumMainViewController.m
//  TimeAblum
//
//  Created by 陈哲是个好孩子 on 2018/1/21.
//  Copyright © 2018年 陈哲是个好孩子. All rights reserved.
//

#import "TAAblumMainViewController.h"
#import <HHZPopupView/HHZPopupOptionsView.h>
#import "TAAblumInfoCell.h"
#import "TACreateAblumViewController.h"

@interface TAAblumMainViewController ()<HHZPopupOptionViewsDelegate>
@property (nonatomic, strong) HHZHttpResult * configResult;

//点击加号的弹出层
@property (nonatomic, strong) HHZPopupOptionsView * popOptionsView;
@end

@implementation TAAblumMainViewController

#pragma mark **********************     视图控制器生命周期  **********************

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"相册";
    [self showNoData];
    [TANavigationViewGenerator createTitleImageRightNaviType:HHZNavigationViewGeneratorRight Title:nil nolmalImage:[UIImage imageNamed:@"ablum_main_add_btn"] selectedImage:[UIImage imageNamed:@"ablum_main_add_btn"] andNavi:self andSEL:@selector(showAblumPopView)];
    [self requestAblumData];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[TATabbarTool shareManager].tabbar showTabbarView:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark **********************        数据初始化      **********************

-(void)initializeData
{
    [super initializeData];
    self.dataArray = [NSMutableArray array];
}

#pragma mark **********************         视图创建      **********************

-(void)createMainView
{
    [super createMainView];
    self.tableView.frame = CGRectMake(0, 0, SCREENW, SCREENH - [[TATabbarTool shareManager] getTabbarHeight] - 64);
    self.tableView.contentInset = UIEdgeInsetsMake(10, 0, 0, 0);
}

#pragma mark **********************  属性以及视图创建后的基本操作  ******************

#pragma mark **********************         重写方法       ***********************

#pragma mark **********************        自定义方法       ***********************

-(void)requestAblumData
{
    self.configResult = [self.currentService configCondition:nil];
    LoadingCommonStart
}

/**
 显示无相片视图
 */
-(void)showNoData
{
    [super showNoData];
    [self.noneDataView showAblumNoImages];
}

-(void)showNormalView
{
    [super showNormalView];
    self.noneDataView.hidden = YES;
}

-(void)showAblumPopView
{
    self.popOptionsView.hidden = NO;
}

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


#pragma mark 自定义辅助方法 懒加载
-(HHZPopupOptionsView *)popOptionsView
{
    if (!_popOptionsView)
    {
        _popOptionsView = [[HHZPopupOptionsView alloc] init];
        _popOptionsView.itemHeight = 50;
        _popOptionsView.itemWidth = 120;
        _popOptionsView.titleFont = [UIFont boldSystemFontOfSize:16.0f];
        _popOptionsView.titleColor = [UIColor blackColor];
        _popOptionsView.topShape.fillColor = [UIColor whiteColor];
        _popOptionsView.topShape.lineColor = [UIColor whiteColor];
        _popOptionsView.bgView.backgroundColor = [UIColor whiteColor];
        _popOptionsView.shadowView.backgroundColor = [UIColor clearColor];
        _popOptionsView.delegate = self;
        _popOptionsView.bottomLineColor = [UIColor lightGrayColor];
        [_popOptionsView showPopupOptionsViewTitle:@[@"创建相册",@"加入相册"] imageArray:nil point:CGPointMake(SCREENW - 25, 50)];
        _popOptionsView.hidden = YES;
        _popOptionsView.isShowShape = NO;
        _popOptionsView.bgView.layer.cornerRadius = 0;
        _popOptionsView.bgView.layer.masksToBounds = YES;
    }
    return _popOptionsView;
}

#pragma mark **********************         触发事件       ***********************

#pragma mark **********************         回调事件       ***********************

#pragma mark HHZPopupOptionViewsDelegate 回调
-(void)dlTapToHidden
{
    self.popOptionsView.hidden = YES;
}

-(void)dlTapOptionAtIndex:(NSInteger)index
{
    self.popOptionsView.hidden = YES;
    TACreateAblumViewController * vc = [[TACreateAblumViewController alloc] initWithNibName:@"TACreateAblumViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark 回调事件 - UITableViewDelegate

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
    return [TAAblumInfoCell configCellWithUITableView:tableView indexPath:indexPath dataArray:self.dataArray];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}


#pragma mark 回调事件 - 网络请求

-(void)requestSuccess:(HHZHttpResponse *)response
{
    if (response.tag == self.configResult.tag)
    {
        [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(test) userInfo:nil repeats:NO];
    }
}


-(void)test
{
    TAAblumInfoModel * model1 = [TAAblumInfoModel new];
    model1.imageUrl = @"http://c.hiphotos.baidu.com/zhidao/pic/item/b812c8fcc3cec3fdf65553e7d688d43f8794273c.jpg";
    model1.imageTitle = @"一家人";
    model1.imageDescription = @"5个成员  366张照片";
    
    TAAblumInfoModel * model2 = [TAAblumInfoModel new];
    model2.imageUrl = @"https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=756559113,978606092&fm=27&gp=0.jpg";
    model2.imageTitle = @"一家人2";
    model2.imageDescription = @"52个成员  3626张照片";
    
    [self.dataArray addObject:model1];
    [self.dataArray addObject:model2];
    [self.dataArray addObject:model1];
    [self.dataArray addObject:model2];
    [self.dataArray addObject:model1];
    [self.dataArray addObject:model2];
    [self.dataArray addObject:model1];
    [self.dataArray addObject:model2];
    [self.dataArray addObject:model1];
    [self.dataArray addObject:model2];
    
    [self showNormalView];
    [self.tableView reloadData];
    
    LoadingCommonStop
}

-(void)requestFail:(HHZHttpResponse *)response
{
    if (response.tag == self.configResult.tag)
    {
        [self.currentService handleFailInfo:response];
    }
}

@end
