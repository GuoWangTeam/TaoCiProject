//
//  STNavigationController.m
//  01-weibo
//
//  Created by 王戈 on 14-7-3.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "STNavigationController.h"

@interface STNavigationController ()

@end

@implementation STNavigationController

+ (void)initialize
{
    [self setupNavigationBarItemTheme];
    [self setupNavigationBarTheme];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.navigationBar setTintColor:[UIColor whiteColor]];
}

// 拦截住所有push出来的Controller 以设置其NavigationItem
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0 ) {
        // 隐藏底部标签
        viewController.hidesBottomBarWhenPushed = YES;

//        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"navigationbar_back" highImageName:@"navigationbar_back_highlighted" target:self SEL:@selector(back)];
//        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImageName:@"navigationbar_more" highImageName:@"navigationbar_more_highlighted" target:self SEL:@selector(home)];
    }
    [super pushViewController:viewController animated:YES];
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}

- (void)home
{
    [self popToRootViewControllerAnimated:YES];
}

+ (void)setupNavigationBarItemTheme
{
    UIBarButtonItem *appearance = [UIBarButtonItem appearance];
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    [appearance setTitleTextAttributes:attrs forState:UIControlStateNormal];
    
    NSMutableDictionary *attrsHigh = [NSMutableDictionary dictionaryWithDictionary:attrs];
    attrsHigh[NSForegroundColorAttributeName] = [UIColor redColor];
    [appearance setTitleTextAttributes:attrsHigh forState:UIControlStateHighlighted];
    
    NSMutableDictionary *attrsDisable = [NSMutableDictionary dictionaryWithDictionary:attrs];
    attrsDisable[NSForegroundColorAttributeName] = [UIColor grayColor];
    [appearance setTitleTextAttributes:attrsDisable forState:UIControlStateDisabled];
    
    [appearance setBackgroundImage:[UIImage imageWithName:@"navigationbar_button_background"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];

}

+ (void)setupNavigationBarTheme
{
    UINavigationBar *appearance = [UINavigationBar appearance];

    if (1) {
        [appearance setBackgroundImage:[UIImage imageWithName:@"navigationbar_background"] forBarMetrics:UIBarMetricsDefault];
    }
    
    NSString *colorStr = [NSString stringWithFormat:@"#54B6C9"];
    [appearance setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [appearance setBarTintColor:[UIColor colorWithString:colorStr]];
    
    appearance.tintColor = [UIColor whiteColor];
    [appearance setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    appearance.barTintColor = [UIColor colorWithString:colorStr];
    
    NSMutableDictionary *attris= [NSMutableDictionary dictionary];
    attris[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];
    attris[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [appearance setTitleTextAttributes:attris];
    
    appearance.translucent = NO;
}
@end
