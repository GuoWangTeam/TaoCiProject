//
//  CategoryLeftCell.m
//  陶瓷
//
//  Created by 王戈 on 15/6/7.
//  Copyright (c) 2015年 王戈. All rights reserved.
//

#import "CategoryLeftCell.h"

@implementation CategoryLeftCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *identifier = @"CategoryLeftCell";
    // 1.取缓存中取
    CategoryLeftCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.创建cell
    if (cell == nil) {
         cell = [[CategoryLeftCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    UIView *selectedBackgroundView = [[UIView alloc] initWithFrame:cell.bounds];
    selectedBackgroundView.backgroundColor = [UIColor whiteColor];
    cell.selectedBackgroundView = selectedBackgroundView;
    cell.backgroundColor = TCMainBGColor;
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    
    return cell;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    self.textLabel.textColor = selected ? TCMainBGColor : [UIColor whiteColor];
}

@end
