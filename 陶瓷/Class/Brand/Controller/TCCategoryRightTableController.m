//
//  TCCategoryRightTableController.m
//  陶瓷
//
//  Created by 王戈 on 15/6/6.
//  Copyright (c) 2015年 王戈. All rights reserved.
//

#import "TCCategoryRightTableController.h"
#import "CategoryTableViewCell.h"

#define AD_FRAME

@interface TCCategoryRightTableController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation TCCategoryRightTableController

- (UIView *)contentView
{
    if (_contentView == nil) {
        _contentView = [[UIView alloc] initWithFrame:self.view.bounds];
        _contentView.backgroundColor = [UIColor clearColor];
    }
    return _contentView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.contentView];
    [self.contentView addSubview:self.tableView];
}


- (void)setContentViewFrame:(CGRect)frame
{
    self.contentView.frame = frame;
    [self.tableView reloadData];
    [self.collectionView reloadData];
}

#pragma mark - table view

- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.contentView.bounds style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CategoryTableViewCell *cell = [CategoryTableViewCell cellWithTableView:tableView];
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

#pragma mark - collection view

- (UICollectionView *)collectionView
{
    if (_collectionView == nil) {
//        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
//        [flowLayout setItemSize:CGSizeMake(29.5*per, 19.5*per)]; // 设置cell的尺寸
//        [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal]; // 设置其布局方向
//        flowLayout.sectionInset = UIEdgeInsetsMake(5, 50, 5, 5);
//        flowLayout.minimumLineSpacing = per;
//        
//        CGFloat collectionViewX = 0;
//        CGFloat collectionViewY = CGRectGetMaxY(pictureLabel.frame);
//        CGFloat collectionViewWidth = descripeLabel.width;
//        CGFloat collectionViewHeight = 28*per;
//        _picturesView = [[UICollectionView alloc]initWithFrame:CGRectMake(collectionViewX, collectionViewY,collectionViewWidth,collectionViewHeight) collectionViewLayout:flowLayout];
//        _picturesView.dataSource = self;
//        _picturesView.delegate = self;
//        _picturesView.backgroundColor = [UIColor clearColor];
//        [_picturesView registerClass:[pictureCell class] forCellWithReuseIdentifier:@"picture"];
//        [_scrollView addSubview:_picturesView];
//        
//        _collectionView = []
    }
    return nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    if (_tableView.hidden) {
        [_tableView removeFromSuperview];
        _tableView = nil;
    } else if (_collectionView.hidden) {
        [_collectionView removeFromSuperview];
        _collectionView = nil;
    }
}
@end
