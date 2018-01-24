//
//  TAMineListCell.m
//  TimeAblum
//
//  Created by 陈哲是个好孩子 on 2018/1/24.
//  Copyright © 2018年 陈哲是个好孩子. All rights reserved.
//

#import "TAMineListCell.h"

@interface TAMineListCell ()
@property (weak, nonatomic) IBOutlet UILabel *MineContentLabel;

@end

@implementation TAMineListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(instancetype)configTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath dataArray:(NSMutableArray *)dataArray
{
    static NSString * TAMineListCellIndentifier = @"TAMineListCellIndentifier";
    TAMineListCell * cell = [tableView dequeueReusableCellWithIdentifier:TAMineListCellIndentifier];
    if (!cell)
    {
        cell = [[[UINib nibWithNibName:@"TAMineListCell" bundle:nil] instantiateWithOwner:nil options:nil] lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.MineContentLabel.text = dataArray[indexPath.row];
    return cell;
}
@end
