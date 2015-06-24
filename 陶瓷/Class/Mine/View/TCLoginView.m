//
//  TCLoginView.m
//  陶瓷
//
//  Created by 王戈 on 15/6/11.
//  Copyright (c) 2015年 王戈. All rights reserved.
//

#import "TCLoginView.h"

@interface TCLoginView ()
@property (weak, nonatomic) IBOutlet UIButton *iconBtn;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *levelLabel;
@property (weak, nonatomic) IBOutlet UIButton *addressBtn;

@property (weak, nonatomic) IBOutlet UIButton *favoriteBtn;
@property (weak, nonatomic) IBOutlet UIButton *messageBtn;
@property (weak, nonatomic) IBOutlet UIView *whiteLine;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end


@implementation TCLoginView

- (void)setIsLogin:(BOOL)isLogin
{
    _isLogin = isLogin;
    _favoriteBtn.hidden = !isLogin;
    _messageBtn.hidden = !isLogin;
    _whiteLine.hidden = !isLogin;
    _addressBtn.hidden = !isLogin;
    _nameLabel.hidden = !isLogin;
    _levelLabel.hidden = !isLogin;
    
    _loginBtn.hidden = isLogin;
}

- (IBAction)login:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(userLogin)]) {
        [self.delegate userLogin];
    }
}

@end
