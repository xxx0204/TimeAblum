//
//  BaseNoneDataView.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/2/24.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <HHZBaseClass/HHZLabel.h>

@protocol HHZNoneDataViewDelegate <NSObject>

@optional
-(void)dlTapDataViewForRequestNewData;
@end

@interface BaseNoneDataView : UIView
@property (nonatomic, assign) id<HHZNoneDataViewDelegate> delegate;
/**
 *  显示的图片
 */
@property (nonatomic, strong) UIImageView * iconView;
/**
 *  显示的文本
 */
@property (nonatomic, strong) HHZLabel * textLabel;

@end
