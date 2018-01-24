//
//  TAAblumInfoCell.h
//  TimeAblum
//
//  Created by 陈哲是个好孩子 on 2018/1/23.
//  Copyright © 2018年 陈哲是个好孩子. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TAAblumInfoModel.h"

@interface TAAblumInfoCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *imageTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *imageDescriptionLabel;

+(instancetype)configCellWithUITableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath dataArray:(NSMutableArray *)dataArray;
@end
