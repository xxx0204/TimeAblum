//
//  TALoginUtil.m
//  TimeAblum
//
//  Created by 王旭 on 2018/1/23.
//  Copyright © 2018年 陈哲是个好孩子. All rights reserved.
//

#import "TALoginUtil.h"

@implementation TALoginUtil

+(void)showLoginVC:(loginBlockCallBack)loginCallBack {
    TALoginViewController *login = [TALoginViewController new];
    login.loginCallBack = loginCallBack;
    [[TAUIKitUtil getCurrentVC] presentViewController:login animated:YES completion:^{
        
    }];
}

@end
