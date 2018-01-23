//
//  TATabbarTool.h
//  TimeAblum
//
//  Created by 陈哲是个好孩子 on 2018/1/21.
//  Copyright © 2018年 陈哲是个好孩子. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TATabbar.h"


NS_ASSUME_NONNULL_BEGIN

@interface TATabbarTool : NSObject
@property (nonatomic, strong) TATabbar * tabbar;

/**
 *  获取tabbar实例
 *
 */
+(instancetype)shareManager;


/**
 *  每次项目启动从Appdelegate获取tabbar实例
 *
 */
-(void)getTabbarInstance:(id)tabbar;


/**
 *  获取tabbar高度
 *
 */
-(CGFloat)getTabbarHeight;
@end

NS_ASSUME_NONNULL_END
