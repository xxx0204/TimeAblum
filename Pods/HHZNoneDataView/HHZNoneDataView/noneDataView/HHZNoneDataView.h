//
//  HHZNoneDataView.h
//  HHZNoneDataView
//
//  Created by 陈哲是个好孩子 on 2017/7/20.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import "BaseNoneDataView.h"

typedef NS_ENUM(NSInteger,HHZNoneDataViewType){
    HHZNoneDataViewTypeText = 101,
    HHZNoneDataViewTypeIcon,
    HHZNoneDataViewTypeIconAndText,
};

NS_ASSUME_NONNULL_BEGIN

@interface HHZNoneDataView : BaseNoneDataView
/**
 *  配置文本字体和文本和图片的间隙（PS：在配置图片和文字之前调用）
 *
 *  @param font     字体
 *  @param space    图片和文本间隙
 */
-(void)configTextFont:(UIFont *)font space:(CGFloat)space;

/**
 *  配置图片和文字
 *
 *  @param iconImage 显示的图片
 *  @param text      显示的文字
 */
-(void)configFrame:(CGRect)frame IconImage:(UIImage *)iconImage text:(NSString *)text delegate:(id<HHZNoneDataViewDelegate>)delegate;


/**
 *  修改缺省图片和文字
 *
 *  @param iconImage 显示的图片
 *  @param text      显示的文字
 */
-(void)updateIconImage:(UIImage *)iconImage andText:(NSString *)text;
@end

NS_ASSUME_NONNULL_END
