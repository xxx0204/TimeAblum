//
//  HHZPersonInfoCommonCell.h
//  HHZBaseClass
//
//  Created by 仁和Mac on 2017/9/29.
//  Copyright © 2017年 陈哲是个好孩子. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HHZPersonInfoCommonCellModel : NSObject
//左标题
@property (nonatomic, copy) NSString * leftTitle;
//左图片名称
@property (nonatomic, copy) NSString * leftImageName;
//左图片网络地址
@property (nonatomic, copy) NSString * leftImageUrl;

//右标题
@property (nonatomic, copy) NSString * rightTitle;
//右图片名称
@property (nonatomic, copy) NSString * rightImageName;
//右图片网络地址
@property (nonatomic, copy) NSString * rightImageUrl;

@property (nonatomic, assign) BOOL is;
@end

@interface HHZPersonInfoCommonCell : UITableViewCell
@property (nonatomic, strong) UILabel * leftLabel;
@property (nonatomic, strong) UILabel * leftImageView;
@property (nonatomic, strong) UILabel * rightLabel;
@property (nonatomic, strong) UILabel * rightImageView;
@property (nonatomic, strong) NSIndexPath * indexPath;
@property (nonatomic, strong) HHZPersonInfoCommonCellModel * model;

+(instancetype)configCellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath dataArray:(NSArray *)dataArray;
@end

NS_ASSUME_NONNULL_END
