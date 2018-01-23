//
//  HHZConfigJumpTool.h
//  HHZUtils
//
//  Created by 陈哲是个好孩子 on 2017/10/24.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HHZConfigJumpTool : NSObject
//电池容量
+(void)openBatteryUsage;
//通用设置
+(void)openGeneral;
//存储空间
+(void)openStorage;
//蜂窝数据
+(void)openMobileData;
//Wifi设置
+(void)openWifi;
//蓝牙设置
+(void)openBluetooth;
//定位设置
+(void)openLocation;
//辅助功能
+(void)openAccessibility;
//关于手机
+(void)openAbout;
//键盘设置
+(void)openKeyboard;
//显示设置
+(void)openDisplay;
//声音设置
+(void)openSounds;
//App Store 设置
+(void)openAppStoreConfig;
//墙纸设置
+(void)openWallpaper;
//打开电话
+(void)openPhone;
//世界时钟
+(void)openWorldClock;
//闹钟
+(void)openAlarm;
//秒表
+(void)openStopWatch;
//倒计时
+(void)openClockTimer;
//打开相册
+(void)openPhotos;
@end
