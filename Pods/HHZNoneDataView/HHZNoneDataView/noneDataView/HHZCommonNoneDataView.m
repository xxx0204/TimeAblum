//
//  HHZCommonNoneDataView.m
//  HHZNoneDataView
//
//  Created by 仁和Mac on 2017/9/26.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import "HHZCommonNoneDataView.h"
#import <HHZCategory/UIImageView+HHZCategory.h>
#import <HHZCategory/UILabel+HHZCategory.h>
#import <HHZCategory/UIView+HHZCategory.h>

#define kHHZNoneDataViewDefaultTextSpace 15

@interface HHZCommonNoneDataView()
/**
 *  显示的类型
 */
@property (nonatomic, assign) HHZCommonNoneDataViewType type;
@property (nonatomic, assign) CGFloat space;
@end

@implementation HHZCommonNoneDataView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self.iconView hhz_addTarget:self andSelector:@selector(tapViewForRequest)];
        [self.textLabel hhz_addTarget:self andSelector:@selector(tapViewForRequest)];
        self.textLabel.textAlignment = NSTextAlignmentCenter;
        self.space = 15;
        self.textLabel.limitWidth = [UIScreen mainScreen].bounds.size.width - kHHZNoneDataViewDefaultTextSpace * 2;
    }
    return self;
}

-(void)tapViewForRequest
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(dlTapDataViewForRequestNewData)])
    {
        [self.delegate dlTapDataViewForRequestNewData];
    }
}

-(void)updateTextAndImageSpace:(CGFloat)space
{
    self.space = space;
}

-(void)updateIconImage:(UIImage *)iconImage andText:(NSString *)text
{
    if (iconImage == nil && text != nil)
    {
        self.type = HHZCommonNoneDataViewTypeText;
    }
    else if (iconImage != nil && text == nil)
    {
        self.type = HHZCommonNoneDataViewTypeIcon;
    }
    else if (iconImage != nil && text != nil)
    {
        self.type = HHZCommonNoneDataViewTypeIconAndText;
    }
    else
    {
        return;
    }
    
    switch (self.type)
    {
        case HHZCommonNoneDataViewTypeIconAndText:
        {
            self.iconView.image = iconImage;
            self.textLabel.text = text;
            self.iconView.frame = CGRectMake((self.width - iconImage.size.width)/2, (self.height - iconImage.size.height - self.space - self.textLabel.height)/2, iconImage.size.width, iconImage.size.height);
            self.textLabel.frame = CGRectMake((self.width - self.textLabel.width)/2, self.iconView.height + self.iconView.y + self.space, self.textLabel.width, self.textLabel.height);
            self.iconView.hidden = NO;
            self.textLabel.hidden = NO;
        }
            break;
        case HHZCommonNoneDataViewTypeIcon:
        {
            self.iconView.image = iconImage;
            self.iconView.frame = CGRectMake((self.width - iconImage.size.width)/2, (self.height - self.iconView.height)/2, iconImage.size.width, iconImage.size.height);
            self.textLabel.hidden = YES;
            self.iconView.hidden = NO;
        }
            break;
        case HHZCommonNoneDataViewTypeText:
        {
            self.textLabel.text = text;
            self.textLabel.frame = CGRectMake((self.width - self.textLabel.width)/2, (self.height - self.textLabel.height)/2, self.textLabel.width, self.textLabel.height);
            self.iconView.hidden = YES;
            self.textLabel.hidden = NO;
        }
            break;
            
        default:
            break;
    }
}


@end
