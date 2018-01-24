//
//  TAAblumInfoViewController.m
//  TimeAblum
//
//  Created by 陈哲是个好孩子 on 2018/1/23.
//  Copyright © 2018年 陈哲是个好孩子. All rights reserved.
//

#import "TAAblumInfoViewController.h"
#import "TAAblumInfoQRCodeView.h"

@interface TAAblumInfoViewController ()
@property (nonatomic, strong) TAAblumInfoQRCodeView * QRCodeView;
@end

@implementation TAAblumInfoViewController

#pragma mark **********************     视图控制器生命周期  **********************

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"相册信息";
    BackFunction
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
    [self showQRCodeView];
}

#pragma mark **********************  属性以及视图创建后的基本操作  ******************

#pragma mark **********************         重写方法       ***********************

#pragma mark **********************        自定义方法       ***********************

-(void)showQRCodeView
{
    self.QRCodeView = [[NSBundle mainBundle] loadNibNamed:@"TAAblumInfoQRCode" owner:nil options:nil][0];
    self.QRCodeView.frame = CGRectMake(0, 30, SCREENW, 300);
    [self.view addSubview:self.QRCodeView];
    
    [self.QRCodeView evaluateQRString:@"http://www.baidu.com" content:@"让朋友用\"时间相册app\"扫描下方二维码加入《一家人》相册"];
}

#pragma mark **********************         触发事件       ***********************

-(void)back
{
    [super back];
}

#pragma mark **********************         回调事件       ***********************

@end
