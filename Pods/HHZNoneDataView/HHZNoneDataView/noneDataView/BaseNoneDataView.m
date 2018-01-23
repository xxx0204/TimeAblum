//
//  BaseNoneDataView.m
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/2/24.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "BaseNoneDataView.h"

@implementation BaseNoneDataView

-(UIImageView *)iconView
{
    if (!_iconView)
    {
        _iconView = [[UIImageView alloc] init];
        [self addSubview:_iconView];
    }
    return _iconView;
}

-(HHZLabel *)textLabel
{
    if (!_textLabel)
    {
        _textLabel = [[HHZLabel alloc] init];
        _textLabel.numberOfLines = 0;
        [self addSubview:_textLabel];
    }
    return _textLabel;
}

@end
