//
//  TAViewController.m
//  TimeAblum
//
//  Created by 陈哲是个好孩子 on 2018/1/21.
//  Copyright © 2018年 陈哲是个好孩子. All rights reserved.
//

#import "TAViewController.h"
#import "TATabbarTool.h"

@interface TAViewController ()

@end

@implementation TAViewController

#pragma mark 视图控制器生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = Common_Gray_Color;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [TATabbarTool shareManager].tabbar.tabBar.hidden = YES;
}


#pragma mark 数据初始化
-(void)initializeData
{
    
}


#pragma mark 视图创建
-(void)createMainView
{
    
}

#pragma mark 属性以及视图创建后的基本操作
-(void)doSomeThingsBeforeShow
{
    
}

#pragma mark 重写方法或协议方法
#pragma mark 重写方法或协议方法 RHViewControllerMethod
-(void)showNoNetwork
{
    [self handleNoneDataView];
    self.noneDataView.hidden = NO;
}

-(void)showNoData
{
    [self handleNoneDataView];
    self.noneDataView.hidden = NO;
}

-(void)showNormalView
{
    [self handleNoneDataView];
    self.noneDataView.hidden = YES;
}

-(void)handleNoneDataView
{
    
}


#pragma mark 自定义方法
-(TANoneDataView *)noneDataView
{
    if (!_noneDataView)
    {
        _noneDataView = [[TANoneDataView alloc] init];
        _noneDataView.backgroundColor = kColor(241, 241, 241, 1);
        _noneDataView.textLabel.textColor = [UIColor blackColor];
    }
    return _noneDataView;
}

-(TAHttpService *)currentService
{
    if (!_currentService)
    {
        _currentService = [[TAHttpService alloc] init];
        _currentService.delegate = self;
    }
    return _currentService;
}

-(void)cancelAllRequest
{
//    NSArray * arr = [self hhz_getPrivateApiProperty];
//    for (NSString * key in arr)
//    {
//        if ([[self valueForKey:key] isKindOfClass:[HHZHttpResult class]])
//        {
//            [((HHZHttpResult *)[self valueForKey:key]).requestTask cancel];
//            ((HHZHttpResult *)[self valueForKey:key]).tag = 0;
//        }
//    }
}

#pragma mark 触发事件
-(void)back
{
    [self cancelAllRequest];
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark 回调事件

@end
