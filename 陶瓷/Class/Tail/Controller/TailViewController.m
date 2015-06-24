//
//  TailViewController.m
//  陶瓷
//
//  Created by 王戈 on 15/6/3.
//  Copyright (c) 2015年 王戈. All rights reserved.
//

#import "TailViewController.h"

@interface TailViewController ()

@end

@implementation TailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    [[TCNetworkTool sharedNetTool] rentListWithPn:@"1" andSuccessBlocks:^(NSArray *resultArray) {
        
    } andFailureBlocks:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
