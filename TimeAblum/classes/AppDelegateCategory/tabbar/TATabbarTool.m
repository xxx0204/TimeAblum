//
//  TATabbarTool.m
//  TimeAblum
//
//  Created by 陈哲是个好孩子 on 2018/1/21.
//  Copyright © 2018年 陈哲是个好孩子. All rights reserved.
//

#import "TATabbarTool.h"

@implementation TATabbarTool
-(void)getTabbarInstance:(id)tabbar
{
    self.tabbar = (TATabbar *)tabbar;
}

+(instancetype)shareManager
{
    static TATabbarTool * tool = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tool = [[TATabbarTool alloc] init];
    });
    return tool;
}

-(CGFloat)getTabbarHeight
{
    return [self.tabbar getTabbarHeight];
}
@end
