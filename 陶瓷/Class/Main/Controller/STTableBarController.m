//
//  STTableBarController.m
//  01-weibo
//
//  Created by 王戈 on 14-7-3.
//  Copyright (c) 2014年 itcast. All rights reserved.
//
#import "STTableBarController.h"
#import "STNavigationController.h"
#import "CategoryViewController.h"
#import "MineViewController.h"
#import "DiscoverViewController.h"
#import "HomeViewController.h"
#import "TailViewController.h"

#import "STTabbar.h"

@interface STTableBarController ()

@end

@implementation STTableBarController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self setCustomTabBar];
    
    [self addAllChildViewControllers];
    
}

//- (void)viewWillAppear:(BOOL)animated
//{
//    [self setNeedsStatusBarAppearanceUpdate];
//}
//
//- (BOOL)prefersStatusBarHidden
//{
//    return YES;
//}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma mark 设置子控制器
// 添加各类自控制器
- (void)addAllChildViewControllers
{
    HomeViewController *home = [[HomeViewController alloc]init];
    [self addChildViewController:home Title:@"首页" imageName:@"tabbar_home" selectedImageName:@"tabbar_home_selected"];
    
    CategoryViewController *category = [[CategoryViewController alloc]init];
    [self addChildViewController:category Title:@"分类" imageName:@"tabbar_message_center" selectedImageName:@"tabbar_message_center_selected"];
    
    DiscoverViewController *discover = [[DiscoverViewController alloc]init];
    [self addChildViewController:discover Title:@"发现" imageName:@"tabbar_discover" selectedImageName:@"tabbar_discover_selected"];
    
    TailViewController *tail = [[TailViewController alloc]init];
    [self addChildViewController:tail Title:@"尾货" imageName:@"tabbar_discover" selectedImageName:@"tabbar_discover_selected"];
    
    MineViewController *profile = [[MineViewController alloc]init];
    [self addChildViewController:profile Title:@"我的" imageName:@"tabbar_profile" selectedImageName:@"tabbar_profile_selected"];
}

// 设置子控制器的方法
- (void)addChildViewController:(UIViewController *)vc Title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    vc.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:imageName];
    
    
    // 设置字体主题
    NSMutableDictionary *textAttribute = [NSMutableDictionary dictionary];
    textAttribute[NSForegroundColorAttributeName] = [UIColor blackColor];
    textAttribute[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    [vc.tabBarItem setTitleTextAttributes:textAttribute forState:UIControlStateNormal];
    
    NSMutableDictionary *textAttributeSelected = [NSMutableDictionary dictionary];
    textAttributeSelected[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    textAttributeSelected[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [vc.tabBarItem setTitleTextAttributes:textAttributeSelected forState:UIControlStateSelected];
    
//    UIImage *selectedImage = [UIImage imageWithName:selectedImageName];
//    if (iOS7) {
//        selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    }
//    vc.tabBarItem.selectedImage = selectedImage;
    
    
    STNavigationController *nc = [[STNavigationController alloc]initWithRootViewController:vc];
    [self addChildViewController:nc];
}

#pragma mark 设置自定义tabbar
// 设置自定义tabbar
- (void)setCustomTabBar
{
//    STTabbar *customTabbar = [[STTabbar alloc]init];
//    customTabbar.delegate1 = self;
//    [self setValue:customTabbar forKeyPath:@"tabBar"];
}
@end
