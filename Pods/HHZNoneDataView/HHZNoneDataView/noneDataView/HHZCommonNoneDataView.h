//
//  HHZCommonNoneDataView.h
//  HHZNoneDataView
//
//  Created by 仁和Mac on 2017/9/26.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import "BaseNoneDataView.h"

typedef NS_ENUM(NSInteger,HHZCommonNoneDataViewType){
    HHZCommonNoneDataViewTypeText = 101,
    HHZCommonNoneDataViewTypeIcon,
    HHZCommonNoneDataViewTypeIconAndText,
};

NS_ASSUME_NONNULL_BEGIN

@interface HHZCommonNoneDataView : BaseNoneDataView
#pragma mark Optional
/**
 *  更新图片和文本的间隔距离
 */
-(void)updateTextAndImageSpace:(CGFloat)space;
/**
 *  修改缺省图片和文字
 *
 *  @param iconImage 显示的图片
 *  @param text      显示的文字
 */
-(void)updateIconImage:(UIImage * __nullable)iconImage andText:(NSString * __nullable)text;

#pragma mark Required
@end

NS_ASSUME_NONNULL_END
