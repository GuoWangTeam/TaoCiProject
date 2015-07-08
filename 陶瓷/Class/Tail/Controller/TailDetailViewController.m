//
//  TailDetailViewController.m
//  陶瓷
//
//  Created by 郭天龙 on 15/7/7.
//  Copyright (c) 2015年 王戈. All rights reserved.
//

#import "TailDetailViewController.h"
#import "TailDetailTableViewCell.h"
#import "TCNetworkTool.h"
#import "UIImageView+WebCache.h"

@interface TailDetailViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UITableView *tableview;
@property (nonatomic, weak) IBOutlet UIButton *linkCompany;
@property (nonatomic, weak) IBOutlet UIButton *guide;

@property (nonatomic, strong) NSDictionary *dataSource;

@end

@implementation TailDetailViewController

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TailDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TailDetailTableViewCell"];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"TailDetailTableViewCell" owner:nil options:nil].firstObject;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell setModel:self.dataSource];
        
    }
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 250;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.tableview.hidden = YES;
    TCNetworkTool *net = [TCNetworkTool sharedNetTool];
    [net getTailDetailInfoWithId:self.proid SuccessBlocks:^(NSDictionary *resultDic) {
        [self setupHeaderViewWithUri:[resultDic objectForKey:@"HeadImageUrl"]];
        self.dataSource = [resultDic mutableCopy];
        [self.tableview reloadData];
        self.tableview.hidden = NO;
    } andFailureBlocks:^(NSString *failureMessage) {
        ;
    }];
}

- (void)setupHeaderViewWithUri:(NSString *)uri
{
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kDefaultWindowWidth, 180)];
    UIImageView *titleIcon = [[UIImageView alloc] initWithFrame:CGRectMake(kDefaultWindowWidth/2-75, 15, 150, 150)];
    titleIcon.backgroundColor = [UIColor lightGrayColor];
    [titleIcon sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",uri]] placeholderImage:nil];
    [header addSubview:titleIcon];
    
    self.tableview.tableHeaderView = header;
    self.tableview.tableFooterView = [UIView new];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
