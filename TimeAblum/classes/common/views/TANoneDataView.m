//
//  TANoneDataView.m
//  TimeAblum
//
//  Created by 陈哲是个好孩子 on 2018/1/21.
//  Copyright © 2018年 陈哲是个好孩子. All rights reserved.
//

#import "TANoneDataView.h"

@implementation TANoneDataView

-(void)showAblumNoImages
{
    [self updateIconImage:nil andText:@"你还没有相册呢，快去创建相册\n与亲朋好友分享美好照片"];
}

-(void)showNoNetworkViewWithClicked
{
    [self updateIconImage:[UIImage imageNamed:@"wuwangluo"] andText:@"当前无网络,点击后重试!"];
}

-(void)showNoNetworkViewWithBottomPull
{
    [self updateIconImage:[UIImage imageNamed:@"wuwangluo"] andText:@"当前无网络,下拉重试!"];
}

-(void)showNoDataViewWithClicked
{
    [self updateIconImage:[UIImage imageNamed:@"wushuju-1"] andText:@"当前无数据,点击后重新请求."];
}

-(void)showNoDataViewWithBottomPull
{
    [self updateIconImage:[UIImage imageNamed:@"wushuju-1"] andText:@"当前无数据,下拉后重新请求."];
}

@end
