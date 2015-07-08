//
//  HomeHeaderView.h
//  陶瓷
//
//  Created by 郭天龙 on 15/6/13.
//  Copyright (c) 2015年 王戈. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HomeHeaderViewDelegate <NSObject>

- (void)didAdvertiseButton:(id)dic;

@end

@interface HomeHeaderView : UIView


@property (nonatomic, weak) id<HomeHeaderViewDelegate>delegate;

- (void)setArray:(NSArray *)arr;

- (void)setUpAutoScorllTimerFreq:(NSTimeInterval)freq pageloadTime:(NSTimeInterval) seconds;
- (void)stopAutoScorll;

@end
