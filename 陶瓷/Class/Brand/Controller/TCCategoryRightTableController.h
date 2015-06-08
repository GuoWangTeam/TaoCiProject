//
//  TCCategoryRightTableController.h
//  陶瓷
//
//  Created by 王戈 on 15/6/6.
//  Copyright (c) 2015年 王戈. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TCCategoryRightTableController : UIViewController

@property (nonatomic, strong) NSMutableArray *dataSource;
/**
 *  是否是推荐品牌页
 */
@property (nonatomic, assign) BOOL isRecommendView;

@property (nonatomic, strong) UIView *contentView;

/**
 *  设定页面frame
 */
- (void)setContentViewFrame:(CGRect)frame;

@end
