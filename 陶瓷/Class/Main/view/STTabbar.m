//
//  STTabbar.m
//  02-weibo
//
//  Created by 王戈 on 14-7-10.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "STTabbar.h"

@interface STTabbar ()
@property (nonatomic ,weak)UIButton *plusBtn;

@end
@implementation STTabbar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupPlusButton];
        self.selectionIndicatorImage = [UIImage imageNamed:@"navigationbar_button_background"];
    }
    return self;
}
/**
 *  添加加号摁扭
 */
- (void)setupPlusButton
{
    UIButton *plusBtn = [[UIButton alloc]init];
//    [plusBtn setBackgroundImage:[UIImage imageWithName:@"tabbar_compose_button"] forState:UIControlStateNormal];
//    [plusBtn setBackgroundImage:[UIImage imageWithName:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
//    
//    [plusBtn setImage:[UIImage imageWithName:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
//    [plusBtn setImage:[UIImage imageWithName:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
    
    [plusBtn addTarget:self action:@selector(plusClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:plusBtn];
    self.plusBtn = plusBtn;
}

- (void)plusClick
{
    if ([self.delegate1 respondsToSelector:@selector(tabbarPlusBtnClick)]) {
        [self.delegate1 tabbarPlusBtnClick];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    [self setupPlusButtonFrame];
    
    [self setupAllBarButtonsFrame];
}

- (void)setupPlusButtonFrame
{
    self.plusBtn.size = self.plusBtn.currentBackgroundImage.size;
    self.plusBtn.center = CGPointMake(self.width * 0.5, self.height * 0.5);
}

- (void)setupAllBarButtonsFrame
{
    int i = 0;
    
    for (UIView *tabBarButton in self.subviews) {
        if (![tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) continue;
        
        [self setupTabBarButtonFrame:tabBarButton atIndex:i];
    
        [self setupTabBarButtonTextColor:tabBarButton atIndex:i];
        
        i++;
    }
}

- (void)setupTabBarButtonFrame:(UIView *)tabBarButton atIndex:(int)index
{
    int selectedIndex = [self.items indexOfObject:self.selectedItem];
    for (UILabel *label in tabBarButton.subviews) {
        if (![label isKindOfClass:[UILabel class]])continue;
        label.font = [UIFont systemFontOfSize:10];
        if (selectedIndex == index) {
            label.textColor = [UIColor orangeColor];
        }else{
            label.textColor = [UIColor blackColor];
        }
    }
}

- (void)setupTabBarButtonTextColor:(UIView *)tabBarButton atIndex:(int)index
{
    tabBarButton.width = self.width * 0.2;
    tabBarButton.height = self.height;
    tabBarButton.y = 0;
    if (index > 1) {
        tabBarButton.x = (index + 1) * tabBarButton.width;
    }else{
        tabBarButton.x = index * tabBarButton.width;
    }
    
}
@end
