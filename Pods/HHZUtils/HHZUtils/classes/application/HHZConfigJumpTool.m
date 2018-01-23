//
//  HHZConfigJumpTool.m
//  HHZUtils
//
//  Created by 陈哲是个好孩子 on 2017/10/24.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import "HHZConfigJumpTool.h"
#import <UIKit/UIApplication.h>

@implementation HHZConfigJumpTool

+(void)openBatteryUsage
{
    [self openConfigString:@"Prefs:root=BATTERY_USAGE"];
}

+(void)openGeneral
{
    [self openConfigString:@"Prefs:root=General"];
}

+(void)openStorage
{
    [self openConfigString:@"Prefs:root=General&path=STORAGE_ICLOUD_USAGE/DEVICE_STORAGE"];
}

+(void)openMobileData
{
    [self openConfigString:@"Prefs:root=MOBILE_DATA_SETTINGS_ID"];
}

+(void)openWifi
{
    [self openConfigString:@"Prefs:root=WIFI"];
}

+(void)openBluetooth
{
    [self openConfigString:@"Prefs:root=Bluetooth"];
}

+(void)openLocation
{
    [self openConfigString:@"Prefs:root=Privacy&path=LOCATION"];
}

+(void)openAccessibility
{
    [self openConfigString:@"Prefs:root=General&path=ACCESSIBILITY"];
}

+(void)openAbout
{
    [self openConfigString:@"Prefs:root=General&path=About"];
}

+(void)openKeyboard
{
    [self openConfigString:@"Prefs:root=General&path=Keyboard"];
}

+(void)openDisplay
{
    [self openConfigString:@"Prefs:root=DISPLAY"];
}

+(void)openSounds
{
    [self openConfigString:@"Prefs:root=Sounds"];
}

+(void)openAppStoreConfig
{
    [self openConfigString:@"Prefs:root=STORE"];
}

+(void)openWallpaper
{
    [self openConfigString:@"Prefs:root=Wallpaper"];
}

+(void)openPhone
{
    [self openConfigString:@"Mobilephone://"];
}

+(void)openWorldClock
{
    [self openConfigString:@"Clock-worldclock://"];
}

+(void)openAlarm
{
    [self openConfigString:@"Clock-alarm://"];
}

+(void)openStopWatch
{
    [self openConfigString:@"Clock-stopwatch://"];
}

+(void)openClockTimer
{
    [self openConfigString:@"Clock-timer://"];
}

+(void)openPhotos
{
    [self openConfigString:@"Photos://"];
}


+(void)openConfigString:(NSString *)string
{
    NSURL * url = [NSURL URLWithString:string];
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        // 系统小于10的时候，打开Wi-Fi界面
        [[UIApplication sharedApplication] openURL:url];
    } else {
        // 系统大于10的时候直接打开当前App的设置界面
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString] options:@{} completionHandler:nil];
    }
}

@end
