//
//  TANoneDataView.h
//  TimeAblum
//
//  Created by 陈哲是个好孩子 on 2018/1/21.
//  Copyright © 2018年 陈哲是个好孩子. All rights reserved.
//

#import <HHZNoneDataView/HHZCommonNoneDataView.h>

NS_ASSUME_NONNULL_BEGIN

@interface TANoneDataView : HHZCommonNoneDataView

//无相册图片
-(void)showAblumNoImages;

//无网络视图，需要点击
-(void)showNoNetworkViewWithClicked;
//无网络视图，需要下拉
-(void)showNoNetworkViewWithBottomPull;
//无数据视图，需要点击
-(void)showNoDataViewWithClicked;
//无数据视图，需要下拉
-(void)showNoDataViewWithBottomPull;

@end

NS_ASSUME_NONNULL_END
