//
//  HomeViewController.m
//  陶瓷
//
//  Created by 郭天龙 on 15/6/6.
//  Copyright (c) 2015年 王戈. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeHeaderView.h"
#import "HomeHeadTableViewCell.h"
#import "TCNetworkTool.h"
#import "HomeAdvertiseModel.h"
#import "HomeCategoryModel.h"
#import "HomeNomalCellTableViewCell.h"

@interface HomeViewController ()<UITableViewDataSource,UITableViewDelegate,HomeHeaderViewDelegate,HomeHeadTableViewCellDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableview;

@property (nonatomic, strong) HomeAdvertiseModel *model;
@property (nonatomic, strong) NSMutableArray *arrayDataSource;


@end

@implementation HomeViewController
#pragma mark - HomeHeaderViewDelegate
- (void)didAdvertiseButton:(id)dic
{
    
}

#pragma mark - HomeHeadTableViewCellDelegate
- (void)didCategoryButton:(id)dic
{
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    else
    {
        return [self.arrayDataSource count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        HomeHeadTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"homeCellId"];
        if (!cell) {
            cell = [[NSBundle mainBundle] loadNibNamed:@"HomeHeadTableViewCell" owner:nil options:nil].firstObject;
            [cell setDelegate:self];
            [cell setArray:self.model.middelModelArray];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
        }
        return cell;
    }
    else
    {
        HomeNomalCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"homeCellId"];
        if (!cell) {
            cell = [[NSBundle mainBundle] loadNibNamed:@"HomeNomalCellTableViewCell" owner:nil options:nil].firstObject;
            [cell setModelWithDic:[self.arrayDataSource objectAtIndex:indexPath.row]];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        return cell;
    }
}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 160;
    }
    else
    {
        NSDictionary *dic = [self.arrayDataSource objectAtIndex:indexPath.row];
        return [[dic objectForKey:@"Height"] floatValue]/2;
    }
}

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    if (section == 1) {
//        return @"推荐 品牌";
//    }
//    return @"";
//}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0;
    }else
    {
        return 20;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kDefaultWindowWidth, 20)];
    UILabel *headerTitle = [[UILabel alloc] initWithFrame:CGRectMake(20, 1, 100, 18)];
    headerTitle.text = @"推荐 品牌";
    [headerTitle setFont:[UIFont systemFontOfSize:14]];
    UIImageView *bottomline = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, kDefaultWindowWidth , 0.5)];
    bottomline.backgroundColor = [UIColor lightGrayColor];
    [view addSubview:headerTitle];
    [view addSubview:bottomline];
    return view;
}


#pragma mark - lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableview.hidden = YES;
    // Do any additional setup after loading the view from its nib.
    self.tableview.frame = CGRectMake(0, 0, kDefaultWindowWidth, kDefaultWindowHeight);
    self.model = [[HomeAdvertiseModel alloc] init];
    [self refreshTableView];
}

- (void)refreshTableView
{
    TCNetworkTool *net = [TCNetworkTool sharedNetTool];
    [net getHomeAdvertiseSuccessBlocks:^(NSDictionary *resultDic) {
        NSLog(@"%@",resultDic);
        self.tableview.hidden = NO;
        self.model.headerModelArray = [NSArray arrayWithArray:[resultDic objectForKey:@"Top"] ];
        self.model.middelModelArray = [NSArray arrayWithArray:[resultDic objectForKey:@"Middle"] ];
        self.arrayDataSource = [resultDic objectForKey:@"Bottom"];
        [self setupHeaderView];
        [self.tableview reloadData];
        
    } andFailureBlocks:^(NSString *failureMessage) {
        NSLog(@"%@",failureMessage);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupHeaderView
{
    HomeHeaderView *headview = [[NSBundle mainBundle] loadNibNamed:@"HomeHeaderView" owner:nil options:nil].firstObject;
    headview.frame = CGRectMake(0, 0, kDefaultWindowWidth, 140);
    [headview setArray:self.model.headerModelArray];
    
    self.tableview.tableHeaderView = headview;
    if ([self.tableview respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableview setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    }
    
    if ([self.tableview respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableview setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
}

- (void)setupFirstSectionView
{
    
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
