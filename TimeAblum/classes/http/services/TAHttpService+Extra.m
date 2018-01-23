//
//  TAHttpService+Extra.m
//  TimeAblum
//
//  Created by 陈哲是个好孩子 on 2018/1/22.
//  Copyright © 2018年 陈哲是个好孩子. All rights reserved.
//

#import "TAHttpService+Extra.h"

@implementation TAHttpService (Extra)
-(HHZHttpResult *)configCondition:(HHZHttpRequestCondition *)condition
{
    if (!condition) condition = [[HHZHttpRequestCondition alloc] init];
    
    NSMutableDictionary * parameters = [NSMutableDictionary dictionary];
    
    HHZHttpRequest * request = [[HHZHttpRequest alloc] init];
    request.paramaters = parameters;
    request.url = [[TAHttpURLManager shareManager] getConfigURL];
    
    condition.serializerType = HHZHttpSerializerType3;
    
    __weak typeof(self) weakSelf = self;
    return [TAHttpClient sendRequest:request appendCondition:condition success:^(HHZHttpResponse * _Nonnull responseObject) {
        [weakSelf manageServiceSuccess:responseObject];
    } fail:^(HHZHttpResponse * _Nonnull responseObject) {
        [weakSelf manageServiceFail:responseObject];
    } beforeSend:^(HHZHttpRequest * _Nonnull request, HHZHttpRequestCondition * _Nonnull condition) {
        [weakSelf manageBeforeSendRequest:request condition:condition];
    }];
}
@end
