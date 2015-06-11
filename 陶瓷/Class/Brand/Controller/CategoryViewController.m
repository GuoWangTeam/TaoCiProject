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
#import "CategoryBottomCell.h"

#define LEFT_TABLEVIEW_FRAME CGRectMake(0, 0, SCREEN_WIDTH * 0.33, SCREEN_HEIGHT)
#define RIGHT_TABLEVIEW_FRAME CGRectMake(SCREEN_WIDTH * 0.33, 0, SCREEN_WIDTH * 0.67, SCREEN_HEIGHT)


#define AD_WIDTH 270
#define AD_HEIGHT 92

@interface CategoryViewController ()<UITableViewDelegate ,UITableViewDataSource>

@property (nonatomic, strong) UITableView *leftTableView;

@property (nonatomic, strong) UIView *rightView;
@property (nonatomic, strong) UITableView *rightTableView;
@property (nonatomic, strong) UIButton * adBtn;

@property (nonatomic, strong) NSArray *leftDataSource;
@property (nonatomic, strong) NSMutableArray *rightDataSource;

@property (nonatomic, assign) BOOL isFirst;

@end

@implementation CategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupChildView];
    
    self.isFirst = YES;
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
        [_rightView addSubview:self.adBtn];
    }
    return _rightView;
}

- (UITableView *)rightTableView
{
    if (_rightTableView == nil) {
        _rightTableView = [[UITableView alloc] initWithFrame:_rightView.bounds style:UITableViewStylePlain];
        _rightTableView.y += 64;
        _rightTableView.dataSource = self;
        _rightTableView.delegate = self;
        _rightTableView.separatorStyle =  UITableViewCellSeparatorStyleNone;
    }
    return _rightTableView;
}

#pragma mark - table view

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([tableView isEqual:_leftTableView]) {
       CategoryLeftCell *cell = [CategoryLeftCell cellWithTableView:tableView];
        
        cell.textLabel.text = [NSString stringWithFormat:@"第%d个",indexPath.row + 1] ;
        return cell;
    }
    else if ([tableView isEqual:_rightTableView]) {
        if (_isFirst) {
           CategoryTableViewCell *cell = [CategoryTableViewCell cellWithTableView:tableView];
            return cell;
        } else {
            CategoryBottomCell *cell = [CategoryBottomCell cellWithTableView:tableView];
            if (indexPath.row < 2) {
                
            } else {
                cell.isNeedIcon = NO;
            }
            return cell;
        }
        
    }

    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 左边暂时写死
    if (tableView == _leftTableView) {
        return 95;
    }
    // 右边详细处理
    else if (tableView == _rightTableView) {
        // 如果是推荐品牌
        if (_isFirst) {
            return 95;
        }
        // 其他品牌 ,会分有头像和没头像两种
        else {
            if (indexPath.row < 2) {
                return 65;
            } else {
                return 45;
            }
        }
    }
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 左侧table view 点击
    if (tableView == _leftTableView) {
        // 如果不是第一行
        self.isFirst = !indexPath.row;
        
        [self.rightTableView reloadData];
    }
    // 右侧table view 点击
    else if (tableView == _rightTableView) {
        UIViewController *nextController = [[UIViewController alloc] init];
        [self.navigationController pushViewController:nextController animated:YES];
    }
}

- (void)setIsFirst:(BOOL)isFirst
{
    if (_isFirst == isFirst) {
        return;
    }
    _isFirst = isFirst;
    self.adBtn.hidden = isFirst;
    
    if (isFirst) {
        // 如果是第一行 显示table view
        _rightTableView.frame = CGRectMake(0, 64, SCREEN_WIDTH * 0.67, SCREEN_HEIGHT);
    } else {
        _rightTableView.frame = CGRectMake(0, 154, SCREEN_WIDTH * 0.67, SCREEN_HEIGHT - 90);
    }
}

- (UIButton *)adBtn
{
    if (_adBtn == nil) {
        _adBtn = [[UIButton alloc] init];
        _adBtn.frame = CGRectMake(7, 64 + 7, SCREEN_WIDTH * 0.67 - 14, 90 - 14);
        [_adBtn setImage:[UIImage imageNamed:@"ad"] forState:UIControlStateNormal];
        [_adBtn addTarget:self action:@selector(showAD) forControlEvents:UIControlEventTouchUpInside];
        _adBtn.hidden = YES;
    }
    return _adBtn;
}

- (void)showAD
{
    TCLog(@"摁扭被点击了");
}
@end
