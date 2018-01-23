//
//  HHZNaviItemView.m
//  HHZNavigationView
//
//  Created by 仁和Mac on 2017/7/30.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import "HHZNaviItemView.h"
#import <HHZBaseClass/HHZLabel.h>
#import <HHZCategory/UIView+HHZCategory.h>

@interface HHZNaviItemView ()
//文字正常颜色
@property (nonatomic, strong) UIColor * normalColor;
//文字选中颜色
@property (nonatomic, strong) UIColor * selectedColor;
//文字Font
@property (nonatomic, strong) UIFont * font;
//文字图片上下间隙
@property (nonatomic, assign) CGFloat topSpace;
//文字图片左右间隙
@property (nonatomic, assign) CGFloat leftSpace;
//文字图片之间间隙
@property (nonatomic, assign) CGFloat betweenSpace;


@property (nonatomic, strong) HHZLabel * titleLabel;
@property (nonatomic, strong) HHZNaviImageView * contentImageView;
@end

@implementation HHZNaviItemView

#pragma mark 初始化过程
- (instancetype)init
{
    self = [super init];
    if (self) {
        _normalColor = [UIColor blackColor];
        _selectedColor = [UIColor blackColor];
        _font = [UIFont systemFontOfSize:14.0f];
        _topSpace = 10.0f;
        _leftSpace = 10.0f;
        _betweenSpace = 5.0f;
    }
    return self;
}


-(HHZLabel *)titleLabel
{
    if (!_titleLabel)
    {
        _titleLabel = [[HHZLabel alloc] init];
        _titleLabel.textColor = _normalColor;
        _titleLabel.font = _font;
        [self addSubview:_titleLabel];
    }
    return _titleLabel;
}

-(HHZNaviImageView *)contentImageView
{
    if (!_contentImageView)
    {
        _contentImageView = [[HHZNaviImageView alloc] init];
        [self addSubview:_contentImageView];
    }
    return _contentImageView;
}


-(void)createNaviView:(NSString *)title NormalImage:(UIImage *)normalImage SelectedImage:(UIImage *)selectedImage ShowType:(HHZNaviItemViewShowType)type
{
    CGFloat normalImageWidth = normalImage.size.width;
    CGFloat normalImageHeight = normalImage.size.height;
    
    if (normalImage) self.contentImageView.normalImage = normalImage;
    self.contentImageView.selectedImage = selectedImage;
    
    //如果没有文字，则直接赋值图片就行。
    if (title == nil)
    {
        self.contentImageView.frame = CGRectMake(_leftSpace, (self.height - normalImageHeight)/2, normalImageWidth, normalImageHeight);
        self.frame = CGRectMake(self.x, self.y, normalImageWidth + _leftSpace*2, self.height);
        self.contentImageView.isSelect = NO;
        return;
    }
    
    
    self.titleLabel.text = title;
    
    if (normalImage)
    {
        self.contentImageView.isSelect = NO;
        switch (type) {
            case HHZNaviItemViewShowTypeTitleLeft:
            {
                self.titleLabel.frame = CGRectMake(_leftSpace, (self.height - self.titleLabel.height)/2, self.titleLabel.width, self.titleLabel.height);
                self.contentImageView.frame = CGRectMake(self.titleLabel.xPlusWidth + _betweenSpace, (self.height - normalImageHeight)/2, normalImageWidth, normalImageHeight);
                self.frame = CGRectMake(self.x, self.y, self.contentImageView.xPlusWidth + _leftSpace, self.height);
            }
                break;
            case HHZNaviItemViewShowTypeTitleRight:
            {
                self.contentImageView.frame = CGRectMake(_leftSpace, (self.height - normalImageHeight)/2, normalImageWidth, normalImageHeight);
                self.titleLabel.frame = CGRectMake(self.contentImageView.xPlusWidth + _betweenSpace, (self.height - self.titleLabel.height)/2, self.titleLabel.width, self.titleLabel.height);
                self.frame = CGRectMake(self.x, self.y, self.titleLabel.xPlusWidth + _leftSpace, self.height);
                
            }
                break;
            case HHZNaviItemViewShowTypeTitleBottom:
            {
                CGFloat superViewWidth = MAX(self.titleLabel.width, normalImageWidth) + _leftSpace*2 + _betweenSpace;
                self.contentImageView.frame = CGRectMake((superViewWidth - normalImageWidth)/2, (self.height - normalImageHeight - _betweenSpace - self.titleLabel.height)/2, normalImageWidth, normalImageHeight);
                self.titleLabel.frame = CGRectMake((superViewWidth - self.titleLabel.width)/2, self.contentImageView.yPlushHeight + _betweenSpace, self.titleLabel.width, self.titleLabel.height);
                self.frame = CGRectMake(self.x, self.y, superViewWidth, self.height);
                
            }
                break;
            case HHZNaviItemViewShowTypeTitleTop:
            {
                CGFloat superViewWidth = MAX(self.titleLabel.width, normalImageWidth) + _leftSpace*2 + _betweenSpace;
                self.titleLabel.frame = CGRectMake((superViewWidth - self.titleLabel.width)/2, (self.height - normalImageWidth - _betweenSpace - self.titleLabel.height)/2, self.titleLabel.width, self.titleLabel.height);
                self.contentImageView.frame = CGRectMake((superViewWidth - normalImageWidth)/2, self.titleLabel.yPlushHeight + _betweenSpace, normalImageWidth, normalImageHeight);
                self.frame = CGRectMake(self.x, self.y, superViewWidth, self.height);
            }
                break;
            default:
                break;
        }
    }
    else
    {
        self.titleLabel.frame = CGRectMake(_leftSpace, (self.height - self.titleLabel.height)/2, self.titleLabel.width, self.titleLabel.height);
        self.frame = CGRectMake(self.x, self.y, self.titleLabel.width + _leftSpace*2, self.height);
    }
}


#pragma mark 配置一些基本参数
-(void)configNaviItemViewNormalColor:(UIColor *)normalColor selectedColor:(UIColor *)selectedColor font:(UIFont *)font
{
    if (normalColor) _normalColor = normalColor;
    if (selectedColor) _selectedColor = selectedColor;
    if (font) _font = font;
}

-(void)configImageAndTextTopSpace:(CGFloat)topSpace leftSpace:(CGFloat)leftSpace ImageBetweenTextSpace:(CGFloat)betweenSpace
{
    if (topSpace > 0) _topSpace = topSpace;
    if (leftSpace > 0) _leftSpace = leftSpace;
    if (betweenSpace > 0) _betweenSpace = betweenSpace;
}



@end


@implementation HHZNaviImageView

-(void)setIsSelect:(BOOL)isSelect
{
    _isSelect = isSelect;
    if (_isSelect && self.selectedImage)
    {
        self.image = self.selectedImage;
    }
    else
    {
        self.image = self.normalImage;
    }
}

@end
