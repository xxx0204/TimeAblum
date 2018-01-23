//
//  HHZNaviItemView.h
//  HHZNavigationView
//
//  Created by 仁和Mac on 2017/7/30.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//


#import <UIKit/UIKit.h>

typedef NS_ENUM (NSInteger, HHZNaviItemViewShowType) {
    HHZNaviItemViewShowTypeTitleLeft = 101,               //文字左(如果没有图片、居中)
    HHZNaviItemViewShowTypeTitleRight,                    //文字右(如果没有图片、居中)
    HHZNaviItemViewShowTypeTitleBottom,                   //文字底部(如果没有图片、居中)
    HHZNaviItemViewShowTypeTitleTop,                      //文字顶部(如果没有图片、居中)
};

NS_ASSUME_NONNULL_BEGIN

@interface HHZNaviItemView : UIView


/**
 *  创建Navi视图(必须先设置BaseNaviView的frame)
 *
 *  @param title         文字
 *  @param normalImage   正常情况下图片
 *  @param selectedImage 选中下图片
 *  @param type          显示类型
 *
 */
-(void)createNaviView:(NSString *)title NormalImage:(UIImage *)normalImage SelectedImage:(UIImage *)selectedImage ShowType:(HHZNaviItemViewShowType)type;


#pragma mark 配置一些基本参数(目前只提供图片和文字的组合模式)
/**
 * 配置文本基本信息
    normalColor 文字正常颜色
    selectedColor   文字选中颜色
    font    字Font
 */
-(void)configNaviItemViewNormalColor:(UIColor *)normalColor selectedColor:(UIColor *)selectedColor font:(UIFont *)font;

/**
 * 配置图片／文字间隙
    topSpace    文字图片上下间隙
    leftSpace   文字图片左右间隙
    betweenSpace    文字图片之间间隙
 */
-(void)configImageAndTextTopSpace:(CGFloat)topSpace leftSpace:(CGFloat)leftSpace ImageBetweenTextSpace:(CGFloat)betweenSpace;

@end


@interface HHZNaviImageView : UIImageView
/**
 *  正常图片
 */
@property (nonatomic, strong) UIImage * normalImage;
/**
 *  选中后的图片
 */
@property (nonatomic, strong) UIImage * selectedImage;
/**
 *  是否被选中
 */
@property (nonatomic, assign) BOOL isSelect;
@end

NS_ASSUME_NONNULL_END
