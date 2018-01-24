//
//  TAJoinQRCodeView.m
//  TimeAblum
//
//  Created by 陈哲是个好孩子 on 2018/1/23.
//  Copyright © 2018年 陈哲是个好孩子. All rights reserved.
//

#import "TAJoinQRCodeView.h"
#import <HHZUtils/HHZQRCodeTool.h>

@interface TAJoinQRCodeView ()
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageBottomSpace;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentImageSpace;

@end

@implementation TAJoinQRCodeView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.contentLabel.numberOfLines = 0;
    }
    return self;
}

-(void)evaluateImageUrl:(NSString *)imageUrl content:(NSString *)content
{
    self.iconImageView.image = [HHZQRCodeTool generateCIQRCodeImage:imageUrl size:160];
    self.contentLabel.text = content;
}

-(void)modifyImageBottomSpace:(CGFloat)imageSpace contentSpace:(CGFloat)contentSpace
{
    self.imageBottomSpace.constant = imageSpace;
    self.contentImageSpace.constant = contentSpace;
}

@end
