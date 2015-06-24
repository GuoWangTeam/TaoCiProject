//
//  RegisterController.m
//  陶瓷
//
//  Created by 王戈 on 15/6/22.
//  Copyright (c) 2015年 王戈. All rights reserved.
//

#import "RegisterController.h"
#import "ChooseAreaView.h"

#define ViewBottom CGRectGetMaxY(_contentView.frame)
#define ChooseAreaViewHeight 225

@interface RegisterController () <ChooseAreaViewDelegate ,UIPickerViewDelegate, UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *cityTextField;
@property (weak, nonatomic) IBOutlet UITextField *provinceTextField;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *confirmTextField;


@property (nonatomic, strong) ChooseAreaView *areaView;
@property (weak, nonatomic) IBOutlet UIScrollView *contentView;
// 当前省
@property (nonatomic, strong) AreaModel *currentProvince;
// 当前市
@property (nonatomic, strong) AreaModel *currentCity;
@property (nonatomic, strong) dispatch_queue_t requestQueue;

@property (nonatomic, strong) NSMutableArray *areaDataSource;
@property (nonatomic, assign) BOOL isChoosingCity;

@end

@implementation RegisterController

- (void)viewDidLoad {
    [super viewDidLoad];

    
}

#pragma mark - 选择地区相关
- (IBAction)chooseAreaButton:(UIButton *)sender {
    // 点击的是省
    if ([sender.currentTitle isEqualToString:@"省"]) {
        if (self.areaView.y == ViewBottom) {
            dispatch_async(self.requestQueue, ^{
                
                _isChoosingCity = NO;
                
                [[TCNetworkTool sharedNetTool] areaWithParentID:@"1" andSuccessBlocks:^(NSArray *resultArray) {
                    self.areaDataSource = [resultArray copy];
                    [self reloadAreaViewData];
                    [self moveAreaViewUp:YES];
                    
                } andFailureBlocks:^(NSString *failureMessage) {
                    NSLog(@"%@",failureMessage);
                }];
            });

        }
    }
    // 点击的是市
    else if ([sender.currentTitle isEqualToString:@"市"]) {
        // 如果已经选择了省份 ,就根据省份选择城市信息
        if (_currentProvince) {
            dispatch_async(self.requestQueue, ^{
                
                _isChoosingCity = YES;
                
                [[TCNetworkTool sharedNetTool] areaWithParentID:_currentProvince.ID andSuccessBlocks:^(NSArray *resultArray) {
                    
                    self.areaDataSource = [resultArray copy];
                    [self reloadAreaViewData];
                    [self moveAreaViewUp:YES];
                    
                } andFailureBlocks:^(NSString *failureMessage) {
                    NSLog(@"%@",failureMessage);
                }];
            });
        }
        // 如果还没选择省份 就让丫先选省份 !
        else {
            [STAlertView st_promptAlertWithMessage:@"请先选择省份!"];
        }
    }

}

- (ChooseAreaView *)areaView {
    if (_areaView == nil) {
        _areaView = [[ChooseAreaView alloc] init];
        _areaView.y = CGRectGetMaxY(_contentView.frame);
        _areaView.size = CGSizeMake(SCREEN_WIDTH, ChooseAreaViewHeight);
        _areaView.pickerView.delegate = self;
        _areaView.deleagte = self;
        _areaView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_areaView];
    }
    return _areaView;
}

- (void)reloadAreaViewData {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.areaView.pickerView reloadComponent:0];
    });
}

// 把areaView往上移 或是往下
- (void)moveAreaViewUp:(BOOL)up {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [UIView animateWithDuration:0.5 animations:^{
            if (up) {
                self.areaView.y = ViewBottom - ChooseAreaViewHeight;
            } else {
                self.areaView.y = ViewBottom;
            }
        }];
    });
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return _areaDataSource.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSArray *areaName = [_areaDataSource valueForKeyPath:@"name"];
    return areaName[row];
}

- (void)hasChoosedArea {
    NSInteger index = [self.areaView.pickerView selectedRowInComponent:0];
    
    if(_isChoosingCity) {
        _currentCity = _areaDataSource[index];
        _cityTextField.text = _currentCity.name;
    
    } else {
        _currentProvince = _areaDataSource[index];
        _provinceTextField.text = _currentProvince.name;
    }
    
    [self moveAreaViewUp:NO];
}

- (dispatch_queue_t)requestQueue {
    if (_requestQueue == nil) {
        _requestQueue = dispatch_queue_create("request_thread", NULL);
    }
    return _requestQueue;
}

- (IBAction)submitCheck {
    if (!_nameTextField.text.length) {
        [STAlertView st_promptAlertWithMessage:@"请填写您的昵称!"];
        return;
    }
    if (!_passwordTextField.text.length) {
        [STAlertView st_promptAlertWithMessage:@"请填写您的密码!"];
        return;
    }
    if (!_confirmTextField.text.length) {
        [STAlertView st_promptAlertWithMessage:@"请确认您的密码!"];
        return;
    }
    if (!_currentCity) {
        [STAlertView st_promptAlertWithMessage:@"请选择您的城市!"];
        return;
    }
    if (!_currentProvince) {
        [STAlertView st_promptAlertWithMessage:@"请选择您的省份!"];
        return;
    }
    
    [self submitToRegister];
}

- (void)submitToRegister {
    
    [SVProgressHUD showWithStatus:@"正在注册 请稍候"];
    
    [[TCNetworkTool sharedNetTool] registerWithEmail:_nameTextField.text password:_passwordTextField.text confirmPassword:_confirmTextField.text andSuccessBlocks:^(NSString *successMessage) {
        TCLog(@"successMessage - %@",successMessage);
        [SVProgressHUD dismiss];
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"注册成功 !" delegate:self cancelButtonTitle:@"确认" otherButtonTitles:nil, nil];
        [alertView show];
        
    } andFailureBlocks:^(NSString *failureMessage) {
        TCLog(@"failureMessage - %@",failureMessage);
        [SVProgressHUD dismiss];
    }];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if ([alertView.title isEqualToString:@"注册成功 !"]) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}


@end
