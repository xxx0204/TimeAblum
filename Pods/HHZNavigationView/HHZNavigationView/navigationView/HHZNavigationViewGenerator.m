//
//  HHZNavigationViewGenerator.m
//  HHZNavigationView
//
//  Created by 仁和Mac on 2017/7/30.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import "HHZNavigationViewGenerator.h"


@implementation HHZNavigationViewGenerator

+(void)createNaviType:(HHZNavigationViewGeneratorType)type Title:(NSString *)title nolmalImage:(UIImage *)image selectedImage:(UIImage *)selectedImage andNavi:(UIViewController *)vc andSEL:(SEL)clickAction
{
    UIBarButtonItem * item = [self createNaviWithTitle:title nolmalImage:image selectedImage:selectedImage andNavi:vc andSEL:clickAction];
    [self configBarButtonItems:type item:item navi:vc];
}

+(void)createNaviType:(HHZNavigationViewGeneratorType)type customView:(UIView *)customView andNavi:(UIViewController *)vc
{
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithCustomView:customView];
    [self configBarButtonItems:type item:item navi:vc];
}

+(UIBarButtonItem *)createNaviWithTitle:(NSString *)title nolmalImage:(UIImage *)image selectedImage:(UIImage *)selectedImage andNavi:(UIViewController *)vc andSEL:(SEL)clickAction
{
    HHZNaviItemView * naviView = [[HHZNaviItemView alloc] init];
    naviView.frame = CGRectMake(0, 20, 0, topNavigationHeight);
    [naviView createNaviView:title NormalImage:image SelectedImage:selectedImage ShowType:HHZNaviItemViewShowTypeTitleLeft];
    
    [naviView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:vc action:clickAction]];
    
    return [[UIBarButtonItem alloc] initWithCustomView:naviView];
}

+(void)configBarButtonItems:(HHZNavigationViewGeneratorType)type item:(UIBarButtonItem *)item navi:(UIViewController *)vc
{
    switch (type) {
        case HHZNavigationViewGeneratorLeft:
        {
            vc.navigationItem.leftBarButtonItems = [self addBarButtonItem:item type:type navi:vc];
        }
            break;
        case HHZNavigationViewGeneratorRight:
        {
            vc.navigationItem.rightBarButtonItems = [self addBarButtonItem:item type:type navi:vc];
        }
            break;
            
        default:
            break;
    }
}

//叠加式的添加到左右中的BarItem中
+(NSArray<UIBarButtonItem *> *)addBarButtonItem:(UIBarButtonItem *)barItem type:(HHZNavigationViewGeneratorType)type navi:(UIViewController *)vc
{
    NSMutableArray<UIBarButtonItem *> *barItems;
    switch (type) {
        case HHZNavigationViewGeneratorLeft:
        {
            barItems = [NSMutableArray arrayWithArray:vc.navigationItem.leftBarButtonItems];
        }
            break;
        case HHZNavigationViewGeneratorRight:
        {
            barItems = [NSMutableArray arrayWithArray:vc.navigationItem.rightBarButtonItems];
        }
            break;
            
        default:
            break;
    }
    
    if (barItems.count == 0)
    {
        UIBarButtonItem * negativeSeperator = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        negativeSeperator.width = -barItemSpace;
        
        [barItems addObject:negativeSeperator];
        [barItems addObject:barItem];
    }
    else
    {
        [barItems addObject:barItem];
    }
    
    return barItems;
}


@end
