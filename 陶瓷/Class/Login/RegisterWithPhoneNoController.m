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
    RegisterController *rVC = [[RegisterController alloc] init];
    [self.navigationController pushViewController:rVC animated:YES];
    
}


@end
