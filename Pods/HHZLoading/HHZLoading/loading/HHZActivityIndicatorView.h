//
//  HHZActivityIndicatorView.h
//  HHZLoading
//
//  Created by 仁和Mac on 2017/9/29.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HHZActivityIndicatorView : UIActivityIndicatorView
/**
 *  创建HHZActivityIndicatorView。  默认style为UIActivityIndicatorViewStyleGray
 */
+(instancetype)createActivityWithSuperView:(UIView *)superView;

/**
 *  创建HHZActivityIndicatorView
 * style:UIActivityIndicatorViewStyleWhiteLarge  ,  UIActivityIndicatorViewStyleWhite  ,   UIActivityIndicatorViewStyleGray
 */
+(instancetype)createActivityWithSuperView:(UIView *)superView style:(UIActivityIndicatorViewStyle)style;
@end

NS_ASSUME_NONNULL_END
