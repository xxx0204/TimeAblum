//
//  TAViewController.h
//  TimeAblum
//
//  Created by 陈哲是个好孩子 on 2018/1/21.
//  Copyright © 2018年 陈哲是个好孩子. All rights reserved.
//

#import <HHZBaseClass/HHZViewController.h>
#import "TAViewControllerMethod.h"
#import "TAHttpService.h"
#import "TANoneDataView.h"
#import "TATabbarTool.h"

#import "TAHttpService+Extra.h"

NS_ASSUME_NONNULL_BEGIN

@interface TAViewController : HHZViewController<HHZHttpServiceDelegate,HHZNoneDataViewDelegate,TAViewControllerMethod>
//网络请求Server
@property (nonatomic, strong) TAHttpService * currentService;
//无数据界面
@property (nonatomic, strong) TANoneDataView * noneDataView;

#pragma mark 显示状态
//无网络
-(void)showNoNetwork;
//无数据
-(void)showNoData;
//正常显示
-(void)showNormalView;
//添加DataView
-(void)handleNoneDataView;

@end

NS_ASSUME_NONNULL_END
