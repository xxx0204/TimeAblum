//
//  HHZViewController.h
//  iOS-HHZUniversal
//
//  Created by 陈哲#376811578@qq.com on 16/11/16.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark **********************     视图控制器生命周期  **********************

#pragma mark **********************        数据初始化      **********************

#pragma mark **********************         视图创建      **********************

#pragma mark **********************  属性以及视图创建后的基本操作  ******************

#pragma mark **********************         重写方法       ***********************

#pragma mark **********************        自定义方法       ***********************

#pragma mark **********************         触发事件       ***********************

#pragma mark **********************         回调事件       ***********************

@interface HHZViewController : UIViewController
/**
 *  初始化数据(重写)
 */
-(void)initializeData;

/**
 *  创建主视图(重写)
 */
-(void)createMainView;

/**
 *  视图创建完之后做的一些事情，比如网络请求等
 */
-(void)doSomeThingsBeforeShow;

/**
 *  离开当前视图(重写)
 */
-(void)back;


@end
