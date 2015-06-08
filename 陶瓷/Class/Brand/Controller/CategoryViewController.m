//
//  CategoryViewController.m
//  陶瓷
//
//  Created by 王戈 on 15/6/3.
//  Copyright (c) 2015年 王戈. All rights reserved.
//

#import "CategoryViewController.h"
#import "TCCategoryRightTableController.h"
#import "CategoryTableViewCell.h"
#import "CategoryLeftCell.h"


#define LEFT_TABLEVIEW_FRAME CGRectMake(0, 0, SCREEN_WIDTH * 0.33, SCREEN_HEIGHT)
#define RIGHT_TABLEVIEW_FRAME CGRectMake(SCREEN_WIDTH * 0.33, 0, SCREEN_WIDTH * 0.67, SCREEN_HEIGHT)

#define AD_WIDTH 270
#define AD_HEIGHT 92

@interface CategoryViewController ()<UITableViewDelegate ,UITableViewDataSource>

@property (nonatomic, strong) UITableView *leftTableView;

@property (nonatomic, strong) UIView *rightView;
@property (nonatomic, strong) UITableView *rightTableView;
@property (nonatomic, strong) UICollectionView *rightCollectionView;

@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation CategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupChildView];
}

- (void)setupChildView
{
    [self.view addSubview:self.leftTableView];
    [self.view addSubview:self.rightView];
}

- (UITableView *)leftTableView
{
    if (_leftTableView == nil) {
        _leftTableView = [[UITableView alloc] initWithFrame:LEFT_TABLEVIEW_FRAME style:UITableViewStylePlain];
    
        _leftTableView.dataSource = self;
        _leftTableView.delegate = self;
    }
    return _leftTableView;
}

- (UIView *)rightView
{
    if (_rightView == nil) {
        _rightView = [[UIView alloc] initWithFrame:RIGHT_TABLEVIEW_FRAME];
        _rightView.backgroundColor = [UIColor whiteColor];
        
        [_rightView addSubview:self.rightTableView];
        [_rightView addSubview:self.rightCollectionView];
    }
    return _rightView;
}

- (UITableView *)rightTableView
{
    if (_rightTableView == nil) {
        _rightTableView = [[UITableView alloc] initWithFrame:_rightView.bounds style:UITableViewStylePlain];
        
        _rightTableView.dataSource = self;
        _rightTableView.delegate = self;
    }
    return _rightTableView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    if ([tableView isEqual:_leftTableView]) {
        cell = [CategoryLeftCell cellWithTableView:tableView];
        
        cell.textLabel.text = [NSString stringWithFormat:@"第%d个",indexPath.row + 1] ;
    }
    else if ([tableView isEqual:_rightTableView]) {
        cell = [CategoryTableViewCell cellWithTableView:tableView];
    }

    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 95;
}
@end
