//
//  TAJoinQRCodeView.h
//  TimeAblum
//
//  Created by 陈哲是个好孩子 on 2018/1/23.
//  Copyright © 2018年 陈哲是个好孩子. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TAJoinQRCodeView : UIView
//赋值二维码图片和文本信息
-(void)evaluateImageUrl:(NSString *)imageUrl content:(NSString *)content;

//赋值图片和文本底部间隙
-(void)modifyImageBottomSpace:(CGFloat)imageSpace contentSpace:(CGFloat)contentSpace;
@end
