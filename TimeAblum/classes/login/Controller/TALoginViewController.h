//
//  TALoginViewController.h
//  TimeAblum
//
//  Created by 王旭 on 2018/1/23.
//  Copyright © 2018年 陈哲是个好孩子. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^loginBlockCallBack)(id loginInfo); //登录成功之后的回调

@interface TALoginViewController : UIViewController

@property (nonatomic, copy) loginBlockCallBack loginCallBack;

@end
