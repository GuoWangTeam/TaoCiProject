//
//  CategoryTableViewCell.m
//  陶瓷
//
//  Created by 王戈 on 15/6/6.
//  Copyright (c) 2015年 王戈. All rights reserved.
//

#import "CategoryTableViewCell.h"

@implementation CategoryTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *identifier = @"CategoryTableViewCell";
    // 1.取缓存中取
    CategoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.创建cell
    if (cell == nil) {
        // cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        // 如果找不到就从xib中创建cell
        cell =  [[[NSBundle mainBundle] loadNibNamed:@"CategoryTableViewCell" owner:nil options:nil] firstObject];
    }
    return cell;
}

@end
