//
//  MineLoginViewController.m
//  陶瓷
//
//  Created by 郭天龙 on 15/6/14.
//  Copyright (c) 2015年 王戈. All rights reserved.
//

#import "MineLoginViewController.h"
#import "RegisterWithPhoneNoController.h"
#import "WPString.h"
#import "UserManager.h"

@interface MineLoginViewController ()

@property (nonatomic, weak) IBOutlet UITextField *userNameText;
@property (nonatomic, weak) IBOutlet UITextField *passWordText;
@property (nonatomic, weak) IBOutlet UIButton    *loginInButton;
@property (nonatomic, weak) IBOutlet WPHotspotLabel    *registButton;
@property (nonatomic, weak) IBOutlet WPHotspotLabel    *findPassWordButton;

@property (nonatomic, strong) UIButton *cover;
@end

@implementation MineLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSDictionary* style = @{@"body":[UIFont fontWithName:@"HelveticaNeue-Bold" size:14.0],
                             @"Action":[WPAttributedStyleAction styledActionWithAction:^{
                                 RegisterWithPhoneNoController *registerVC = [[RegisterWithPhoneNoController alloc] init];
                                 [self.navigationController pushViewController:registerVC animated:YES];
                             }],
                             @"link":@[[UIColor blueColor],@{NSUnderlineStyleAttributeName : @(kCTUnderlineStyleSingle|kCTUnderlinePatternSolid)}]
                             };
    self.registButton.attributedText = [@"<Action>手机快速注册</Action>" attributedStringWithStyleBook:style];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)viewBtnClick:(UIButton *)sender {
    if ([self checkLogin]) {
        [self login];
    }
}

- (BOOL)checkLogin {
    if (!_userNameText.text.length) {
        [STAlertView st_promptAlertWithMessage:@"请输入用户名 !"];
        return NO;
    }
    if (!_passWordText.text.length) {
        [STAlertView st_promptAlertWithMessage:@"请输入密码 !"];
        return NO;
    }
    return YES;
}

- (void)login {
    
    [SVProgressHUD showWithStatus:@"正在登录.. 请稍候"];
    [self.view addSubview:self.cover];
    
    [[TCNetworkTool sharedNetTool] tokenWithEmail:_userNameText.text password:_passWordText.text andSuccessBlocks:^(id successMessage) {
        
        [SVProgressHUD dismiss];
        
        [SVProgressHUD showSuccessWithStatus:@"登陆成功"];
        [self.cover removeFromSuperview];
        
        
        UserManager * manager = [UserManager sharedUserManager];
        NSDictionary *dic = successMessage;
        manager.userModel.userName = [dic objectForKey:@"userName"];
        manager.userModel.token = [dic objectForKey:@"access_token"];
        manager.userModel.token_type = [dic objectForKey:@"token_type"];
        
        [[NSUserDefaults standardUserDefaults] setValue:@"YES" forKey:LOGIN_STATE];
        
        [self.navigationController popViewControllerAnimated:YES];
        
    } andFailureBlocks:^(NSString *failureMessage) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"登录失败 ! 请检查用户名和密码" message:nil delegate:self cancelButtonTitle:@"确认" otherButtonTitles:nil, nil];
        [self.cover removeFromSuperview];
        [alertView show];
       
        [SVProgressHUD dismiss];
        
    }];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if ([alertView.title isEqualToString:@"注册成功 !"]) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

- (UIButton *)cover {
    if (_cover == nil) {
        _cover = [[UIButton alloc] initWithFrame:self.view.bounds];
        _cover.backgroundColor = [UIColor clearColor];
    }
    return _cover;
}

@end
