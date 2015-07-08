//
//  TailViewController.m
//  陶瓷
//
//  Created by 郭天龙 on 15/7/6.
//  Copyright (c) 2015年 王戈. All rights reserved.
//

#import "TailViewController.h"
#import "TCNetworkTool.h"
#import "TailTableViewCell.h"
#import "TailDetailViewController.h"

@interface TailViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UIRefreshControl *refreshControl;
@property (nonatomic, strong) NSArray *dataSource;

@property (nonatomic, strong) IBOutlet UITableView *tableview;

@end

@implementation TailViewController

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TailTableViewCell"];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"TailTableViewCell" owner:nil options:nil].firstObject;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell setModel:[self.dataSource objectAtIndex:indexPath.row]];
        
    }
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TailDetailViewController *tdvc = [[TailDetailViewController alloc] init];
    tdvc.proid = [[self.dataSource objectAtIndex:indexPath.row] objectForKey:@"Id"];
    [self.navigationController pushViewController:tdvc animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self loadTailInfo];
    [self.navigationItem setTitle:@"尾货中心"];
    self.tableview.tableFooterView = [UIView new];
    self.tableview.hidden = YES;
    
    self.refreshControl = [[UIRefreshControl alloc]init];
    //    self.refreshControl.tintColor = [UIColor blueColor];
//    self.refreshControl.attributedTitle = [[NSAttributedString alloc]initWithString:@"下拉刷新"];
    [self.refreshControl addTarget:self action:@selector(RefreshViewControlEventValueChanged) forControlEvents:UIControlEventValueChanged];
    [self.tableview addSubview:self.refreshControl];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadTailInfo
{
    TCNetworkTool *net = [TCNetworkTool sharedNetTool];
    [net getTailListSuccessBlocks:^(NSArray *resultArray) {
        self.dataSource = [resultArray mutableCopy];
        [self.tableview reloadData];
        self.tableview.hidden = NO;
        if (self.refreshControl.refreshing) {
            [self.refreshControl endRefreshing];
        }
    } andFailureBlocks:^(NSString *failureMessage) {
        NSLog(@"%@",failureMessage);
    }];
}

#pragma mark - action

-(IBAction)clickPublickInfo:(id)sender
{
    
}

- (void)RefreshViewControlEventValueChanged
{
//    self.refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"更新数据中..."];
    [self loadTailInfo];
}

@end
