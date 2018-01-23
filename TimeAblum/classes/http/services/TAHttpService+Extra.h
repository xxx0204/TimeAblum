//
//  TAHttpService+Extra.h
//  TimeAblum
//
//  Created by 陈哲是个好孩子 on 2018/1/22.
//  Copyright © 2018年 陈哲是个好孩子. All rights reserved.
//

#import "TAHttpService.h"

NS_ASSUME_NONNULL_BEGIN

@interface TAHttpService (Extra)
/**
 *  基本配置信息接口
 */
-(HHZHttpResult *)configCondition:(HHZHttpRequestCondition * _Nullable )condition;
@end

NS_ASSUME_NONNULL_END
