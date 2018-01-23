//
//  TANavigationViewGenerator.m
//  TimeAblum
//
//  Created by 陈哲是个好孩子 on 2018/1/21.
//  Copyright © 2018年 陈哲是个好孩子. All rights reserved.
//

#import "TANavigationViewGenerator.h"

@implementation TANavigationViewGenerator

+(void)createTitleImageRightNaviType:(HHZNavigationViewGeneratorType)type Title:(NSString *)title nolmalImage:(UIImage *)image selectedImage:(UIImage *)selectedImage andNavi:(UIViewController *)vc andSEL:(SEL)clickAction
{
    UIBarButtonItem * item = [self createTitleImageRightNaviWithTitle:title nolmalImage:image selectedImage:selectedImage andNavi:vc andSEL:clickAction];
    
    [self configBarButtonItems:type item:item navi:vc];
}

+(UIBarButtonItem *)createTitleImageRightNaviWithTitle:(NSString *)title nolmalImage:(UIImage *)image selectedImage:(UIImage *)selectedImage andNavi:(UIViewController *)vc andSEL:(SEL)clickAction
{
    HHZNaviItemView * naviView = [[HHZNaviItemView alloc] init];
    naviView.frame = CGRectMake(0, 20, 0, topNavigationHeight);
    [naviView configNaviItemViewNormalColor:[UIColor whiteColor] selectedColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:18.0f]];
    [naviView createNaviView:title NormalImage:image SelectedImage:selectedImage ShowType:HHZNaviItemViewShowTypeTitleLeft];
    
    [naviView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:vc action:clickAction]];
    
    return [[UIBarButtonItem alloc] initWithCustomView:naviView];
}

+(void)createRedTitleNaviType:(HHZNavigationViewGeneratorType)type Title:(NSString *)title nolmalImage:(UIImage *)image selectedImage:(UIImage *)selectedImage andNavi:(UIViewController *)vc andSEL:(SEL)clickAction
{
    UIBarButtonItem * item = [self createRedTitleNaviWithTitle:title nolmalImage:image selectedImage:selectedImage andNavi:vc andSEL:clickAction];
    
    [self configBarButtonItems:type item:item navi:vc];
}

+(UIBarButtonItem *)createRedTitleNaviWithTitle:(NSString *)title nolmalImage:(UIImage *)image selectedImage:(UIImage *)selectedImage andNavi:(UIViewController *)vc andSEL:(SEL)clickAction
{
    HHZNaviItemView * naviView = [[HHZNaviItemView alloc] init];
    naviView.frame = CGRectMake(0, 20, 0, topNavigationHeight);
    [naviView configNaviItemViewNormalColor:[UIColor redColor] selectedColor:[UIColor redColor] font:[UIFont systemFontOfSize:18.0f]];
    [naviView createNaviView:title NormalImage:image SelectedImage:selectedImage ShowType:HHZNaviItemViewShowTypeTitleLeft];
    
    [naviView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:vc action:clickAction]];
    
    return [[UIBarButtonItem alloc] initWithCustomView:naviView];
}

@end
