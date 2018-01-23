//
//  HHZActivityIndicatorView.m
//  HHZLoading
//
//  Created by 仁和Mac on 2017/9/29.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import "HHZActivityIndicatorView.h"

#define kHHZActivityIndicatorViewWidth 30

@implementation HHZActivityIndicatorView

+(instancetype)createActivityWithSuperView:(UIView *)superView
{
    return [self createActivityWithSuperView:superView style:UIActivityIndicatorViewStyleGray];
}

+(instancetype)createActivityWithSuperView:(UIView *)superView style:(UIActivityIndicatorViewStyle)style
{
    HHZActivityIndicatorView * activityIndicatorView = [[HHZActivityIndicatorView alloc] initWithFrame:CGRectMake((superView.bounds.size.width - kHHZActivityIndicatorViewWidth)/2, (superView.bounds.size.height - kHHZActivityIndicatorViewWidth)/2, kHHZActivityIndicatorViewWidth, kHHZActivityIndicatorViewWidth)];
    activityIndicatorView.activityIndicatorViewStyle = style;
    [superView addSubview:activityIndicatorView];
    return activityIndicatorView;
}

@end
