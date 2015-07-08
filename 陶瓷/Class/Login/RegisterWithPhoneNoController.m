//
//  RegisterWithPhoneNoController.m
//  陶瓷
//
//  Created by 王戈 on 15/6/22.
//  Copyright (c) 2015年 王戈. All rights reserved.
//

#import "RegisterWithPhoneNoController.h"
#import "RegisterController.h"

@interface RegisterWithPhoneNoController ()

@property (nonatomic, weak) IBOutlet UITextField *textField;
@property (nonatomic, strong) NSString *verifycode;

@end

@implementation RegisterWithPhoneNoController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)nestStep {
    [SVProgressHUD showWithStatus:@"正在注册 请稍候"];
    [[TCNetworkTool sharedNetTool] verifyCodeWithCallNumber:_textField.text andSuccessBlocks:^(NSString *successMessage) {
        [SVProgressHUD dismiss];
        RegisterController *rVC = [[RegisterController alloc] init];
        rVC.verify = successMessage;
        [self.navigationController pushViewController:rVC animated:YES];
    } andFailureBlocks:^(NSString *failureMessage) {
        [SVProgressHUD dismiss];
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"获取密码失败 !" message:failureMessage delegate:self cancelButtonTitle:@"确认" otherButtonTitles:nil, nil];
        [alertView show];
    }];
    
    
    
}


@end
