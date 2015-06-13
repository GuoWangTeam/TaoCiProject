//
//  MineViewController.m
//  陶瓷
//
//  Created by 王戈 on 15/6/10.
//  Copyright (c) 2015年 王戈. All rights reserved.
//

#import "TailViewController.h"
#import "AFNetworking.h"
#import "TCLoginView.h"

@interface TailViewController ()

{
    NSOperationQueue *operationQueue;
}

//@property (nonatomic, strong) UITextField *userName;
//@property (nonatomic, strong) UITextField *password;
//@property (nonatomic, strong) UITextField *confirmPW;
//@property (nonatomic, strong) UIButton    *confirmBtn;
//@property (nonatomic, strong) UIButton    *loginBtn;


@end

@implementation TailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    TCLoginView *loginView = [[[NSBundle mainBundle] loadNibNamed:@"TCLoginView" owner:nil options:nil] firstObject];
    loginView.frame = CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT * 0.25);
    
    [self.view addSubview:loginView];
    // Do any additional setup after loading the view from its nib.
    
    //    self.view.backgroundColor = [UIColor greenColor];
    //
    //    _userName = [[UITextField alloc] init];
    //    _password = [[UITextField alloc] init];
    //    _confirmPW = [[UITextField alloc] init];
    //
    //    _confirmBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    //    [_confirmBtn addTarget:self action:@selector(clickRegistBtn:) forControlEvents:UIControlEventTouchUpInside];
    //    _loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    //    [_loginBtn addTarget:self action:@selector(clickLoginButton:) forControlEvents:UIControlEventTouchUpInside];
    //
    //    [self.view addSubview:_userName];
    //    [self.view addSubview:_password];
    //    [self.view addSubview:_confirmPW];
    //    [self.view addSubview:_confirmBtn];
    //    [self.view addSubview:_loginBtn];
    
    
}

- (void)viewDidAppear:(BOOL)animated
{
    //    _userName.frame = CGRectMake(20, 60, 200, 40);
    //    _userName.backgroundColor = [UIColor whiteColor];
    //    _password.frame = CGRectMake(20, 102, 200, 40);
    //    _password.backgroundColor = [UIColor whiteColor];
    //    _confirmPW.frame = CGRectMake(20 , 144, 200, 40);
    //    _confirmPW.backgroundColor = [UIColor whiteColor];
    //
    //    _confirmBtn.frame = CGRectMake(20, 200, 80, 30);
    //    _loginBtn.frame = CGRectMake(20, 240, 80, 30);
    //    [_confirmBtn setTitle:@"注册" forState:UIControlStateNormal];
    //    [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
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


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
