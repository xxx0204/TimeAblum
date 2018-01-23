//
//  TAHttpService.m
//  TimeAblum
//
//  Created by 陈哲是个好孩子 on 2018/1/21.
//  Copyright © 2018年 陈哲是个好孩子. All rights reserved.
//

#import "TAHttpService.h"

@implementation TAHttpService
#pragma mark 重载网络请求处理
/**
 *  处理请求服务器成功返回的数据
 *
 *  @param responseObject 服务器返回的数据
 */
-(void)manageServiceSuccess:(HHZHttpResponse *)responseObject
{
    NSString * codeStr = [NSString stringWithFormat:@"%@",((HHZHttpResponse *)responseObject).object[@"ret"]];
    if ([codeStr isEqualToString:@"1"])
    {
        if(_delegate && [_delegate respondsToSelector:@selector(requestSuccess:)])
        {
            [_delegate performSelector:@selector(requestSuccess:) withObject:responseObject];
        }
    }
    else
    {
        NSString * code = [NSString stringWithFormat:@"%@",((HHZHttpResponse *)responseObject).object[@"error"][@"errorCode"]];
        if ([code isEqualToString:@"402"])
        {
        }
        else
        {
            ((HHZHttpResponse *)responseObject).isRequestSuccessFail = YES;
            if (_delegate && [_delegate respondsToSelector:@selector(requestFail:)])
            {
                [_delegate performSelector:@selector(requestFail:) withObject:responseObject];
            }
        }
    }
}

/**
 *  处理因网络情况导致的网络失败请求
 *
 */
-(void)manageServiceFail:(HHZHttpResponse *)responseObject
{
    responseObject.isRequestSuccessFail = NO;
    if (_delegate && [_delegate respondsToSelector:@selector(requestFail:)])
    {
        [_delegate performSelector:@selector(requestFail:) withObject:responseObject];
    }
}

#pragma mark 网络失败回调调用的
-(void)handleFailInfo:(HHZHttpResponse *)responeseObject
{
    if (responeseObject.taskState == NSURLSessionTaskStateCanceling) responeseObject.alertType = HHZHttpAlertTypeNone;
    
    if (responeseObject.isRequestSuccessFail)
    {
        [self handleHttpSuccessErrorInfo:responeseObject];
    }
    else
    {
        [self handleHttpFailInfo:responeseObject];
    }
}

-(void)handleHttpSuccessErrorInfo:(HHZHttpResponse *)response
{
    [self showErrorTitle:response.object[@"error"][@"errorTitle"] msg:[NSString stringWithFormat:@"%@",response.object[@"error"][@"errorMsg"]] code:[NSString stringWithFormat:@"%@",response.object[@"error"][@"errorCode"]] errorType:response.alertType];
}

-(void)handleHttpFailInfo:(HHZHttpResponse *)response
{
    [self showErrorTitle:nil msg:@"网络不给力,请稍候重试!" code:@"000000" errorType:response.alertType];
}

-(void)showErrorTitle:(NSString *)title msg:(NSString *)errorMsg code:(NSString *)errorCode errorType:(HHZHttpAlertType)type
{
    if (title.length == 0) title = @"网络请求失败";
    switch (type)
    {
        case HHZHttpAlertTypeNone:
        {
            
        }
            break;
        case HHZHttpAlertTypeNative:
        {
            // 弹Alert框
            UIAlertView * alert = [[UIAlertView alloc] initWithTitle:title message:errorMsg delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            [alert show];
        }
            break;
        case HHZHttpAlertTypeToast:
        {
            // 弹Toast框
        }
            break;
            
        default:
            break;
    }
}

-(void)manageBeforeSendRequest:(HHZHttpRequest *)request condition:(HHZHttpRequestCondition *) condition
{
    if (_delegate && [_delegate respondsToSelector:@selector(beforeSendRequest:appendCondition:)])
    {
        [_delegate beforeSendRequest:request appendCondition:condition];
    }
}



#pragma mark






#pragma mark 上传图片
@end
