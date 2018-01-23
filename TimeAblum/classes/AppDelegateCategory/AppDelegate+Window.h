//
//  AppDelegate+Window.h
//  RHCRM
//
//  Created by 仁和Mac on 2017/8/1.
//  Copyright © 2017年 Renhe. All rights reserved.
//

#import "AppDelegate.h"
#import "TATabbar.h"

NS_ASSUME_NONNULL_BEGIN

@interface AppDelegate (Window)
/**
 *  创建全局唯一Window
 */
-(void)createWindow;

/**
 *  创建Tabbar
 */
-(TATabbar *)createTabbar;
@end

NS_ASSUME_NONNULL_END
