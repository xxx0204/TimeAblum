//
//  TALoginView.h
//  TimeAblum
//
//  Created by 王旭 on 2018/1/23.
//  Copyright © 2018年 陈哲是个好孩子. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TALoginViewDelegate <NSObject>

@optional
- (void)loginCallBack:(id)obj;

@end

@interface TALoginView : UIView

@property (nonatomic, weak) id<TALoginViewDelegate>delegate;

@end
