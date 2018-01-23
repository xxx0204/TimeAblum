//
//  TAViewControllerMethod.h
//  TimeAblum
//
//  Created by 陈哲是个好孩子 on 2018/1/21.
//  Copyright © 2018年 陈哲是个好孩子. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TAViewControllerMethod <NSObject>
#pragma mark 网络请求相关
//取消当前页面所有请求
-(void)cancelAllRequest;

#pragma mark 视图相关
//显示无网络视图
-(void)showNoNetwork;

//显示无数据视图
-(void)showNoData;

//正常显示视图
-(void)showNormalView;

@end
