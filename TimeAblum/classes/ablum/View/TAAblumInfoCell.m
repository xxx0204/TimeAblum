//
//  TAAblumInfoCell.m
//  TimeAblum
//
//  Created by 陈哲是个好孩子 on 2018/1/23.
//  Copyright © 2018年 陈哲是个好孩子. All rights reserved.
//

#import "TAAblumInfoCell.h"

@implementation TAAblumInfoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(instancetype)configCellWithUITableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath dataArray:(NSMutableArray *)dataArray
{
    static NSString * TAAblumInfoCellIdentifier = @"TAAblumInfoCellIdentifier";
    TAAblumInfoCell * cell = [tableView dequeueReusableCellWithIdentifier:TAAblumInfoCellIdentifier];
    if (!cell)
    {
        cell = [[UINib nibWithNibName:@"TAAblumInfoCell" bundle:nil] instantiateWithOwner:nil options:nil][0];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor clearColor];
    }
    TAAblumInfoModel * model = dataArray[indexPath.row];
    [cell.iconImageView sd_setImageWithURL:[NSURL URLWithString:model.imageUrl]];
    cell.imageTitleLabel.text = model.imageTitle;
    cell.imageDescriptionLabel.text = model.imageDescription;
    return cell;
}

@end
