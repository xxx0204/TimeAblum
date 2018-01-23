//
//  TAHttpURLManager.m
//  TimeAblum
//
//  Created by 陈哲是个好孩子 on 2018/1/21.
//  Copyright © 2018年 陈哲是个好孩子. All rights reserved.
//

#import "TAHttpURLManager.h"

#define Base_URL @"http://localhost:8003"

#define Base_Second_URL @"/api"

@implementation TAHttpURLManager
+(instancetype)shareManager
{
    static id manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
        [manager setValue:[[NSMutableDictionary alloc] init] forKey:@"urlDic"];
        [manager loadURLs];
    });
    return manager;
}

-(NSString *)getRequestUrl:(NSString *)suffix
{
    return [NSString stringWithFormat:@"%@%@",Base_URL,suffix];
}

-(void)loadURLs
{
    [super loadURLs];
    
    //接口地址
    [self pushURL:[self getRequestUrl:[NSString stringWithFormat:@"%@/test/test",Base_Second_URL]] Key:@"config"];
}

-(NSString *)getConfigURL
{
    return self.urlDic[@"config"];
}
@end
