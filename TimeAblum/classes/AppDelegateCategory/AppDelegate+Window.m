//
//  AppDelegate+Window.m
//  RHCRM
//
//  Created by 仁和Mac on 2017/8/1.
//  Copyright © 2017年 Renhe. All rights reserved.
//

#import "AppDelegate+Window.h"
#import <HHZTabbar/HHZTabbarModel.h>

@implementation AppDelegate (Window)

-(void)createWindow
{
    self.window = [[UIWindow alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    self.window.rootViewController = [self createTabbar];
    [self.window makeKeyAndVisible];
}

-(TATabbar *)createTabbar
{
    HHZTabbarModel * model1 = [HHZTabbarModel new];
    model1.sourceVC = @"TAAblumMainViewController";
    model1.title = @"相册";
    model1.normalImageUrl = @"message";
    model1.selectImageUrl = @"message_sel";
    
    HHZTabbarModel * model2 = [HHZTabbarModel new];
    model2.sourceVC = @"TAMineViewController";
    model2.title = @"我的";
    model2.normalImageUrl = @"work";
    model2.selectImageUrl = @"work_sel";
    
    NSArray * tabbarArray = @[model1,model2];
    
    return [TATabbar createTabbarWithTabArray:tabbarArray];
}

@end
