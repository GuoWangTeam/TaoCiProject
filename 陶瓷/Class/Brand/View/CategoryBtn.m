//
//  CategoryBtn.m
//  陶瓷
//
//  Created by 王戈 on 15/6/9.
//  Copyright (c) 2015年 王戈. All rights reserved.
//

#import "CategoryBtn.h"

@interface CategoryBtn ()


@end


@implementation CategoryBtn

- (instancetype)initWithIsContainIcon:(BOOL)isContain
{
    if (self = [super init]) {
        [self setupBtn];
        self.isContainIcon = isContain;
    }
    return self;
}

- (void)setupBtn
{
    self.size = CGSizeMake(220, 44);
    
    [self.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

- (void)setIsContainIcon:(BOOL)isContainIcon
{
    _isContainIcon = isContainIcon;
    
    [self layoutIfNeeded];
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    if (_isContainIcon) {
        return CGRectMake(0, self.height * 0.67, self.width, self.height * 0.33);
    } else {
        return contentRect;
    }
}


- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    if (_isContainIcon) {
        return CGRectMake(0, 0, self.width, self.height * 0.67);
    } else {
        return CGRectZero;
    }
}



@end
