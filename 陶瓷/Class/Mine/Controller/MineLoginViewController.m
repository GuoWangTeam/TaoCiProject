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

@interface MineLoginViewController ()

@property (nonatomic, weak) IBOutlet UITextField *userNameText;
@property (nonatomic, weak) IBOutlet UITextField *passWordText;
@property (nonatomic, weak) IBOutlet UIButton    *loginInButton;
@property (nonatomic, weak) IBOutlet WPHotspotLabel    *registButton;
@property (nonatomic, weak) IBOutlet WPHotspotLabel    *findPassWordButton;

@end

@implementation MineLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated
{
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
