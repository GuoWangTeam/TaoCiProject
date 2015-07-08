//
//  MineViewController.m
//  陶瓷
//
//  Created by 王戈 on 15/6/10.
//  Copyright (c) 2015年 王戈. All rights reserved.
//

#import "MineViewController.h"
#import "AFNetworking.h"
#import "TCLoginView.h"
#import "MineLoginViewController.h"

#define kDefaultNavHeight (IOS7_OR_LATER?64:44)
#define kDefaultNavTitleViewHeight 44


@interface MineViewController () <UITableViewDelegate ,UITableViewDataSource,TCLoginViewDelegate>

{
    NSOperationQueue *operationQueue;
    UIButton *_setButton;
    UIButton *_messageButton;
    MineLoginViewController *_mineLoginViewCV;
}
@property (nonatomic, strong) TCLoginView *loginView;

@end

@implementation MineViewController


#pragma mark - lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigationBar];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupChildView];
}

- (void)setupNavigationBar
{
    self.title = @"我的账户";
    
    
    
    
    
//    UIImage *setImg = [UIImage imageNamed:@""];
    _setButton = [UIButton buttonWithType:UIButtonTypeSystem];
    _setButton.frame = CGRectMake(0, 0, 30,30);
    [_setButton setTitle:@"设置" forState:UIControlStateNormal];
    [_setButton addTarget:self action:@selector(clickSetButton:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_setButton];

//    UIImage *messageImg = [UIImage imageNamed:@""];
    _messageButton = [UIButton buttonWithType:UIButtonTypeSystem];
    _messageButton.frame = CGRectMake(0, 0, 30,30);
    [_messageButton setTitle:@"信息" forState:UIControlStateNormal];
    [_messageButton addTarget:self action:@selector(clickMessageButton:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_messageButton];
    
    self.navigationItem.leftBarButtonItem = leftButtonItem;
    self.navigationItem.rightBarButtonItem = rightButtonItem;
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if ([[[NSUserDefaults standardUserDefaults] valueForKey:LOGIN_STATE] isEqualToString:@"YES"]) {
        self.loginView.isLogin = YES;
    }
}


- (void)setupChildView
{
    TCLoginView *loginView = [[[NSBundle mainBundle] loadNibNamed:@"TCLoginView" owner:nil options:nil] firstObject];
    loginView.delegate = self;
    loginView.frame = CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT * 0.25);
    loginView.isLogin = NO;
    [self.view addSubview:loginView];
    self.loginView = loginView;
    
    //    TCMineFirstCell *firstCell = [[[NSBundle mainBundle] loadNibNamed:@"TCMineFirstCell" owner:nil options:nil] firstObject];
    //    firstCell.frame = CGRectMake(0, CGRectGetMaxY(loginView.frame), SCREEN_WIDTH, SCREEN_HEIGHT * 0.22);
    //    [self.view addSubview:firstCell];
    CGFloat tabieViewY = CGRectGetMaxY(loginView.frame);
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, tabieViewY, SCREEN_WIDTH,SCREEN_HEIGHT - tabieViewY) style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

#pragma mark - Action
- (void)clickSetButton:(UIButton *)button
{
    
}

- (void)clickMessageButton:(UIButton *)button
{
    
}

- (void)userLogin
{
    _mineLoginViewCV = [[MineLoginViewController alloc] init];
    [self.navigationController pushViewController:_mineLoginViewCV animated:YES];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"TCMineCell";
    // 1.取缓存中取
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    
    switch (indexPath.section) {
        case 0:
            if (indexPath.row == 0) {
                cell.textLabel.text = @"我的钱包";
            } else {
                cell.textLabel.text = @"账户余额";
            }
            break;
        case 1:
            if (indexPath.row == 0) {
                cell.textLabel.text = @"发布信息";
            } else {
                cell.textLabel.text = @"信息管理";
            }
            break;
        case 2:
            if (indexPath.row == 0) {
                cell.textLabel.text = @"我的关注";
            } else {
                cell.textLabel.text = @"联系客服";
            }
            break;
        default:
            break;
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 9;
}



- (void)clickRegistBtn:(UIButton *)button
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //申明返回的结果是json类型
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //申明请求的数据是json类型
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    //传入的参数
    NSDictionary *parameters = @{@"Email":@"12345679@qq.com",@"Password":@"123456",@"ConfirmPassword":@"123456"};
    //你的接口地址
    NSString *url = @"http://101.200.232.88/Account/Register";
    //发送请求
    [manager POST:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSArray *arr = [[operation.responseObject objectForKey:@"ModelState"] objectForKey:@""];
        NSLog(@"Error: %@", arr.firstObject);
    }];
}


- (void)clickLoginButton:(UIButton *)button
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //申明返回的结果是json类型
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //申明请求的数据是json类型
//    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    //传入的参数
    NSDictionary *parameters = @{@"grant_type":@"password",@"username":@"123456789@qq.com",@"password":@"123456"};
    //你的接口地址
    NSString *url = @"http://101.200.232.88/Token";
    //发送请求
    [manager POST:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSHTTPURLResponse *response = [error.userInfo objectForKey:@"com.alamofire.serialization.response.error.response"];
        NSLog(@"Error: %ld", (long)response.statusCode);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
