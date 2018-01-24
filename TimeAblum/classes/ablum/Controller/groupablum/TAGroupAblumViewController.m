//
//  TAGroupAblumViewController.m
//  TimeAblum
//
//  Created by 陈哲是个好孩子 on 2018/1/23.
//  Copyright © 2018年 陈哲是个好孩子. All rights reserved.
//

#import "TAGroupAblumViewController.h"
#import "TAJoinQRCodeView.h"
#import "TAAblumInfoViewController.h"

static NSInteger testCount = 0;

@interface TAGroupAblumViewController ()
//扫描群二维码视图
@property (nonatomic, strong) TAJoinQRCodeView * joinQRCodeView;
@end

@implementation TAGroupAblumViewController

#pragma mark **********************     视图控制器生命周期  **********************

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"一家人";
    TabbarHidden
    BackFunction
    [TANavigationViewGenerator createTitleImageRightNaviType:HHZNavigationViewGeneratorRight Title:nil nolmalImage:[UIImage imageNamed:@"ablum_group_btn"] selectedImage:[UIImage imageNamed:@"ablum_group_btn"] andNavi:self andSEL:@selector(showAblumGroupInfo)];
    [TANavigationViewGenerator createTitleImageRightNaviType:HHZNavigationViewGeneratorRight Title:nil nolmalImage:[UIImage imageNamed:@"ablum_main_add_btn"] selectedImage:[UIImage imageNamed:@"ablum_main_add_btn"] andNavi:self andSEL:@selector(test)];
    [self showJoinQRCodeView:1];
}

-(void)test
{
    testCount++;
    if (testCount % 3 == 0)
    {
        [self.joinQRCodeView removeFromSuperview];
        self.joinQRCodeView = nil;
        [self showJoinQRCodeView:1];
        self.joinQRCodeView.hidden = NO;
        self.noneDataView.hidden = YES;
    }
    else if (testCount % 3 == 1)
    {
        [self showNoneUserAndImageView];
        self.joinQRCodeView.hidden = YES;
        self.noneDataView.hidden = NO;
    }
    else if (testCount % 3 == 2)
    {
        [self.joinQRCodeView removeFromSuperview];
        self.joinQRCodeView = nil;
        [self showJoinQRCodeView:2];
        self.joinQRCodeView.hidden = NO;
        self.noneDataView.hidden = YES;
    }
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

//根据成员和相册图片显示不同视图
-(void)showJoinQRCodeView:(NSInteger)type
{
    self.joinQRCodeView = [[NSBundle mainBundle] loadNibNamed:@"TAJoinQRCodeView" owner:nil options:nil][0];
    [self.view addSubview:self.joinQRCodeView];
    
    [self.joinQRCodeView evaluateImageUrl:@"http://c.hiphotos.baidu.com/zhidao/pic/item/b812c8fcc3cec3fdf65553e7d688d43f8794273c.jpg" content:@"让朋友用\"时间相册app\"扫描下方二维码加入《一家人》相册"];
    if (1 == type)
    {
        self.joinQRCodeView.frame = CGRectMake(0, 0, SCREENW, SCREENH - kTopBarHeight);
        [self.joinQRCodeView modifyImageBottomSpace:((SCREENH - kTopBarHeight)/2 - 80) contentSpace:50];
    }
    else if (2 == type)
    {
        self.joinQRCodeView.frame = CGRectMake(0, 10, SCREENW, 300);
        [self.joinQRCodeView modifyImageBottomSpace:40 contentSpace:20];
    }
}

-(void)showNoneUserAndImageView
{
    self.noneDataView.frame = CGRectMake(0, 0, SCREENW, SCREENH - kTopBarHeight);
    [self.view addSubview:self.noneDataView];
    [self.noneDataView updateIconImage:nil andText:Show_Group_None_Image_Upload];

}
#pragma mark **********************         触发事件       ***********************

-(void)back
{
    [super back];
}

//跳转到相册详情页面
-(void)showAblumGroupInfo
{
    TAAblumInfoViewController * vc = [[TAAblumInfoViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark **********************         回调事件       ***********************

@end
