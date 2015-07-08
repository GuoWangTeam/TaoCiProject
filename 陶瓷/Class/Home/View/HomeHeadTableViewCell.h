//
//  HomeHeadTableViewCell.h
//  陶瓷
//
//  Created by 郭天龙 on 15/6/13.
//  Copyright (c) 2015年 王戈. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HomeHeadTableViewCellDelegate <NSObject>

- (void)didCategoryButton:(id)dic;

@end

@interface HomeHeadTableViewCell : UITableViewCell

@property (nonatomic, weak) id<HomeHeadTableViewCellDelegate>delegate;

- (void)setArray:(NSArray *)arr;

@end
