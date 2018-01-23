//
//  TANavigationViewGenerator.h
//  TimeAblum
//
//  Created by 陈哲是个好孩子 on 2018/1/21.
//  Copyright © 2018年 陈哲是个好孩子. All rights reserved.
//

#import <HHZNavigationView/HHZNavigationViewGenerator.h>

NS_ASSUME_NONNULL_BEGIN

@interface TANavigationViewGenerator : HHZNavigationViewGenerator
//文字左图片右
+(void)createTitleImageRightNaviType:(HHZNavigationViewGeneratorType)type Title:(NSString * _Nullable)title nolmalImage:(UIImage * _Nullable)image selectedImage:(UIImage * _Nullable)selectedImage andNavi:(UIViewController *)vc andSEL:(SEL)clickAction;
//红色文字
+(void)createRedTitleNaviType:(HHZNavigationViewGeneratorType)type Title:(NSString * _Nullable)title nolmalImage:(UIImage * _Nullable)image selectedImage:(UIImage * _Nullable)selectedImage andNavi:(UIViewController *)vc andSEL:(SEL)clickAction;
@end

NS_ASSUME_NONNULL_END
