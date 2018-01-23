//
//  TATabbar.m
//  TimeAblum
//
//  Created by 陈哲是个好孩子 on 2018/1/21.
//  Copyright © 2018年 陈哲是个好孩子. All rights reserved.
//

#import "TATabbar.h"
#import <HHZTabbar/HHZTabbarModel.h>
#import "TATabbarTool.h"
#import "TANavigationViewController.h"
#import "TAMineViewController.h"
#import "TAAblumMainViewController.h"

@interface TATabbar ()

@end

@implementation TATabbar

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+(instancetype)createTabbarWithTabArray:(NSArray *)tabbarArray
{
    TATabbar * tabbar = [[TATabbar alloc] init];
    tabbar.fontSize = 22;
    tabbar.tabbarHeight = 60;
    NSMutableArray * nacArr = [NSMutableArray array];
    NSMutableArray * titleArr = [NSMutableArray array];
    NSMutableArray * normalArr = [NSMutableArray array];
    NSMutableArray * selectArr = [NSMutableArray array];
    NSMutableArray * extraArr = [NSMutableArray array];
    HHZTabbarModel * model = nil;
    for (int i = 0; i < tabbarArray.count; ++i) {
        model = (HHZTabbarModel *)tabbarArray[i];
        //后续通过类名生成
        if (model.isBigNoClicked) {
            [extraArr addObject:@"m_"];
        }
        else {
            [extraArr addObject:@""];
        }
        [nacArr addObject:[self createNav:model.sourceVC]];
        [titleArr addObject:model.title];
        [normalArr addObject:model.normalImageUrl];
        [selectArr addObject:model.selectImageUrl];
    }
    [tabbar setTitleArray:titleArr normalImageArray:normalArr selectedImageArray:selectArr ExtraArray:extraArr];
    tabbar.viewControllers = nacArr;
    [tabbar createTabbar];
    [[TATabbarTool shareManager] getTabbarInstance:tabbar];
    return tabbar;
}

+(UINavigationController *)createNav:(NSString *)sourceVC
{
    UIViewController * vc = nil;
    if ([sourceVC isEqualToString:@"TAAblumMainViewController"])
    {
        vc = [[TAAblumMainViewController alloc] init];
    }
    else if ([sourceVC isEqualToString:@"TAMineViewController"])
    {
        vc = [[TAMineViewController alloc] init];
    }
    else
    {
        vc = [[UIViewController alloc] init];
    }
    TANavigationViewController * nac = [[TANavigationViewController alloc] initWithRootViewController:vc];
    [nac configNaviSchemeTextColor:[UIColor blackColor] textfontSize:20.0f isBlod:YES];
    [nac configNaviSchemeBarTintColor:[UIColor whiteColor]];
    return nac;
}

-(void)barItemClicked:(HHZTabbarItem *)item
{
    if (item.isBigNoClicked)
    {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"点到了中间" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alert show];
    }
    else
    {
        [self exchangeCurrentItem:item];
    }
}

@end
