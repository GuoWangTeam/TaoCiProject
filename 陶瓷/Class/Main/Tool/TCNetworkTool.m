//
//  TCNetworkTool.m
//  demo
//
//  Created by 王戈 on 15/6/10.
//  Copyright (c) 2015年 nice. All rights reserved.
//

#import "TCNetworkTool.h"
#import "PortHeader.h"
#import "AFNetworking.h"

@implementation TCNetworkTool

+ (TCNetworkTool *)sharedNetTool
{
    static TCNetworkTool *_sharedNetTool = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedNetTool = [[self alloc] init];
    });
    return _sharedNetTool;
}


#pragma mark -重置密码
- (void) modifyPasswordWithOldPassword:(NSString *)oldPassword newPasswork:(NSString *)newPassword confirmPassword:(NSString *)confirmPassword
                  andSuccessBlocks:(NetDownLoadSuccessBlock)modifySuccess andFailureBlocks:(NetDownLoadFailureBlock)modifyFailure {
    
    NSDictionary *parameters = @{@"OldPassword": oldPassword ,
                               @"NewPassword":newPassword ,
                               @"ConfirmPassword" : confirmPassword};
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //申明返回的结果是json类型
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //申明请求的数据是json类型
    manager.requestSerializer = [AFJSONRequestSerializer serializer];

    //发送请求
    [manager POST:SET_PASSWORD_URL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        modifySuccess(@"SUCCESS");
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSArray *arr = [[operation.responseObject objectForKey:@"ModelState"] objectForKey:@""];
        modifyFailure(arr.firstObject);
    }];
}

#pragma mark - 注册
- (void)registerWithEmail:(NSString *)email password:(NSString *)password confirmPassword:(NSString *)confirmPassword
                      andSuccessBlocks:(NetDownLoadSuccessBlock)registerSuccess andFailureBlocks:(NetDownLoadFailureBlock)registerFailure {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //申明返回的结果是json类型
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //申明请求的数据是json类型
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    //传入的参数
    NSDictionary *parameters = @{@"Email":email,
                                 @"Password":password,
                                 @"ConfirmPassword":confirmPassword};
    //你的接口地址
    //发送请求
    [manager POST:REGISTER_URL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        registerSuccess(@"SUCCESS");
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSDictionary *responseObject = operation.responseObject;
        if (responseObject[@"ModelState"]) {
            registerFailure([NSString stringWithFormat:@"%@",[responseObject[@"ModelState"] objectForKey:@""]]);
        } else if (responseObject[@"Message"]) {
            registerFailure(responseObject[@"Message"]);
        }
    }];
    
}

#pragma mark - 重设密码
- (void)setPassword:(NSString *)password confirmPassword:(NSString *)confirmPassword
         andSuccessBlocks:(NetDownLoadSuccessBlock)modifySuccess andFailureBlocks:(NetDownLoadFailureBlock)modifyFailure {
    
    NSDictionary *dictCode = @{@"NewPassword": password ,
                               @"ConfirmPassword" : confirmPassword};
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager POST:SET_PASSWORD_URL parameters:dictCode success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"%@",responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        modifyFailure(@"注册失败 ");
    }];
}

- (void)getUserinfoWithSuccessBlocks:(NetDownLoadSuccessBlock)modifySuccess andFailureBlocks:(NetDownLoadFailureBlock)modifyFailure {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:GET_USERINFO parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
}


@end
