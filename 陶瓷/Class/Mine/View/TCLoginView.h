//
//  TCLoginView.h
//  陶瓷
//
//  Created by 王戈 on 15/6/11.
//  Copyright (c) 2015年 王戈. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TCLoginViewDelegate <NSObject>

- (void)userLogin;

@end

@interface TCLoginView : UIView

@property (nonatomic ,assign) BOOL isLogin;
@property (nonatomic, weak) id<TCLoginViewDelegate>delegate;

@end
