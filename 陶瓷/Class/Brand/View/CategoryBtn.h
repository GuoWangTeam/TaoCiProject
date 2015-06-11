//
//  CategoryBtn.h
//  陶瓷
//
//  Created by 王戈 on 15/6/9.
//  Copyright (c) 2015年 王戈. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoryBtn : UIButton

- (instancetype)initWithIsContainIcon:(BOOL)isContain;

@property (nonatomic, assign) BOOL isContainIcon;

@end
