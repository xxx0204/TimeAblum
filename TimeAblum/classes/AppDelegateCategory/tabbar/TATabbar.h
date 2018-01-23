//
//  TATabbar.h
//  TimeAblum
//
//  Created by 陈哲是个好孩子 on 2018/1/21.
//  Copyright © 2018年 陈哲是个好孩子. All rights reserved.
//

#import <HHZTabbar/HHZTabbar.h>

NS_ASSUME_NONNULL_BEGIN

@interface TATabbar : HHZTabbar
/**
 *  创建Tabbar实例
 */
+(instancetype)createTabbarWithTabArray:(NSArray *)tabbarArray;
@end

NS_ASSUME_NONNULL_END
