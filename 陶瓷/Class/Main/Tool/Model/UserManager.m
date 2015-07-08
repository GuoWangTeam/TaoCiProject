//
//  UserManager.m
//  陶瓷
//
//  Created by 郭天龙 on 15/6/30.
//  Copyright (c) 2015年 王戈. All rights reserved.
//

#import "UserManager.h"

@implementation UserManager

- (id)init
{
    if (self = [super init]) {
        self.userModel = [[UserModel alloc] init];
    }
    return self;
}

+ (UserManager *)sharedUserManager
{
    static UserManager *_sharedUser = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedUser = [[self alloc] init];
    });
    return _sharedUser;
}


@end
