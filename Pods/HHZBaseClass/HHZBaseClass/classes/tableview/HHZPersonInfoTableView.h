//
//  HHZPersonInfoTableView.h
//  HHZBaseClass
//
//  Created by 仁和Mac on 2017/9/29.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HHZPersonInfoCommonCell.h"


NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger,HHZPersonInfoCommonCellType) {
    HHZPersonInfoCommonCellTypeTitle = 666,
    HHZPersonInfoCommonCellTypeTitleAndImage,
    HHZPersonInfoCommonCellTypeRightTitle,
    HHZPersonInfoCommonCellTypeRightTitleAndImage
};


@protocol HHZPersonInfoTableViewDelegate <NSObject>
//点击Cell事件
-(void)dlClickedCellAtindex:(NSIndexPath *)indexPath;

@end

@interface HHZPersonInfoTableView : UIView
@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) NSMutableArray<HHZPersonInfoCommonCellModel *> * dataArray;
/**
 *  配置Cell基本类型
 */
-(void)configCellType:(HHZPersonInfoCommonCellType)cellType delegate:(id<HHZPersonInfoTableViewDelegate>)delegate;
@end

NS_ASSUME_NONNULL_END
