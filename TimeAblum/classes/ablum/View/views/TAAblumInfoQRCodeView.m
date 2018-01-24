//
//  TAAblumInfoQRCodeView.m
//  TimeAblum
//
//  Created by 陈哲是个好孩子 on 2018/1/24.
//  Copyright © 2018年 陈哲是个好孩子. All rights reserved.
//

#import "TAAblumInfoQRCodeView.h"
#import <HHZUtils/HHZQRCodeTool.h>

@interface TAAblumInfoQRCodeView ()
@property (weak, nonatomic) IBOutlet UIImageView *QRImageView;
@property (weak, nonatomic) IBOutlet UILabel *ContentLabel;

@end

@implementation TAAblumInfoQRCodeView

-(void)evaluateQRString:(NSString *)QRString content:(NSString *)content
{
    self.QRImageView.image = [HHZQRCodeTool generateCIQRCodeImage:QRString size:160];
    self.ContentLabel.text = content;
}

@end
