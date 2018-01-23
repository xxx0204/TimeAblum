//
//  HHZNavigationViewGenerator.h
//  HHZNavigationView
//
//  Created by 仁和Mac on 2017/7/30.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HHZNaviItemView.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger,HHZNavigationViewGeneratorType) {
    HHZNavigationViewGeneratorLeft = 33,
    HHZNavigationViewGeneratorRight,
    HHZNavigationViewGeneratorCenter
};

//Navi整体高度
static const CGFloat topNavigationHeight = 44.0f;

static const CGFloat barItemSpace = 10.0f;

@interface HHZNavigationViewGenerator : NSObject
/**
 *  创建导航视图
 *
 *  @param title         文字
 *  @param image         正常情况下图片
 *  @param selectedImage 选中图片
 *  @param vc            当前的VC
 *  @param clickAction   点击事件
 */
+(void)createNaviType:(HHZNavigationViewGeneratorType)type Title:(NSString * _Nullable)title nolmalImage:(UIImage * _Nullable)image selectedImage:(UIImage * _Nullable)selectedImage andNavi:(UIViewController *)vc andSEL:(SEL)clickAction;

/**
 *  创建自定义导航视图
 *
 *  @param customView  自定义视图
 */
+(void)createNaviType:(HHZNavigationViewGeneratorType)type customView:(UIView *)customView andNavi:(UIViewController *)vc;


#pragma mark 辅助方法
+(void)configBarButtonItems:(HHZNavigationViewGeneratorType)type item:(UIBarButtonItem *)item navi:(UIViewController *)vc;
@end

NS_ASSUME_NONNULL_END
