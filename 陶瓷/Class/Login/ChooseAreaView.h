//
//  ChooseAreaView.h
//  陶瓷
//
//  Created by 王戈 on 15/6/22.
//  Copyright (c) 2015年 王戈. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ChooseAreaViewDelegate <NSObject>

- (void)hasChoosedArea;

@end


@interface ChooseAreaView : UIView

@property (nonatomic, strong) UIPickerView *pickerView;

@property (nonatomic ,weak) id <ChooseAreaViewDelegate> deleagte;

@end
