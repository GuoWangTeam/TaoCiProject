//
//  UserManager.h
//  陶瓷
//
//  Created by 郭天龙 on 15/6/30.
//  Copyright (c) 2015年 王戈. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"

@interface UserManager : NSObject

@property (nonatomic, strong) UserModel *userModel;

+ (UserManager *)sharedUserManager;

@end
