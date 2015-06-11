//
//  CategoryBottomCell.h
//  陶瓷
//
//  Created by 王戈 on 15/6/9.
//  Copyright (c) 2015年 王戈. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoryBottomCell : UITableViewCell

@property (nonatomic, assign) BOOL isNeedIcon;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
