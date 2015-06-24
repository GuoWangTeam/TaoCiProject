//
//  ChooseAreaView.m
//  陶瓷
//
//  Created by 王戈 on 15/6/22.
//  Copyright (c) 2015年 王戈. All rights reserved.
//

#import "ChooseAreaView.h"

@implementation ChooseAreaView

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setupChildView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupChildView];
    }
    return self;
}

- (void)setupChildView
{
    if (_pickerView == nil) {
        _pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 25, SCREEN_WIDTH, 225)];
        [self addSubview:_pickerView];
    }
    
    UIButton *OKBtn = [[UIButton alloc] init];
    [OKBtn setTitle:@"确认" forState:UIControlStateNormal];
    [OKBtn sizeToFit];
    OKBtn.frame = CGRectMake(SCREEN_WIDTH - OKBtn.width - 20, 0, OKBtn.width, 25);
    OKBtn.backgroundColor = [UIColor clearColor];
    [OKBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [OKBtn addTarget:self action:@selector(chooseThis) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:OKBtn];
}

- (void)chooseThis
{
    if ([self.deleagte respondsToSelector:@selector(hasChoosedArea)]) {
        [self.deleagte hasChoosedArea];
    }
}
@end
