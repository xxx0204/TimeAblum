//
//  TAHttpService.h
//  TimeAblum
//
//  Created by 陈哲是个好孩子 on 2018/1/21.
//  Copyright © 2018年 陈哲是个好孩子. All rights reserved.
//

#import <HHZNetwork/HHZHttpService.h>
#import "TAHttpURLManager.h"
#import "TAHttpClient.h"

NS_ASSUME_NONNULL_BEGIN

@interface TAHttpService : HHZHttpService
@property (nonatomic, weak) id<HHZHttpServiceDelegate> delegate;
-(void)manageBeforeSendRequest:(HHZHttpRequest *)request condition:(HHZHttpRequestCondition *) condition;
@end

NS_ASSUME_NONNULL_END
