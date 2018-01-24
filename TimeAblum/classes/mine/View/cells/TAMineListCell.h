//
//  TAMineListCell.h
//  TimeAblum
//
//  Created by 陈哲是个好孩子 on 2018/1/24.
//  Copyright © 2018年 陈哲是个好孩子. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TAMineListCell : UITableViewCell

+(instancetype)configTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath dataArray:(NSMutableArray *)dataArray;
@end
