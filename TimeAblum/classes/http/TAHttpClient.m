//
//  TAHttpClient.m
//  TimeAblum
//
//  Created by 陈哲是个好孩子 on 2018/1/21.
//  Copyright © 2018年 陈哲是个好孩子. All rights reserved.
//

#import "TAHttpClient.h"

@implementation TAHttpClient
+(void)addExtraParamatersWithCondition:(HHZHttpRequest *)request
{
    [super addExtraParamatersWithCondition:request];
}

+(HHZHttpResult *)sendRequest:(HHZHttpRequest *)request appendCondition:(HHZHttpRequestCondition *)condition success:(HHZSuccessBlock)success fail:(HHZFailureBlock)fail beforeSend:( HHZBeforeSendRequest)beforeSend
{
    condition.serializerType = HHZHttpSerializerType3;
    [HHZHttpManager shareManager].responseSerializer.acceptableContentTypes =  [NSSet setWithObjects:@"application/json", @"text/html",@"text/plain",@"text/json",@"text/javascript",nil];
    return [super sendRequest:request appendCondition:condition success:success fail:fail beforeSend:beforeSend];
}
@end
