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
- (void)registerWithEmail:(NSString *)email password:(NSString *)password confirmPassword:(NSString *)confirmPassword verifyCode:(NSString *)verifyCode CityId:(NSString *)CityId
                      andSuccessBlocks:(NetDownLoadSuccessBlock)registerSuccess andFailureBlocks:(NetDownLoadFailureBlock)registerFailure {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //申明返回的结果是json类型
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //申明请求的数据是json类型
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    //传入的参数
    NSDictionary *parameters = @{@"UserName":email,
                                 @"Password":password,
                                 @"ConfirmPassword":confirmPassword,
                                 @"CityId":CityId,
                                 @"NickName":@"nick",
                                 @"VerifyCode":verifyCode};
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

- (void)tokenWithEmail:(NSString *)email password:(NSString *)password andSuccessBlocks:(NetDownLoadSuccessIdBlock)registerSuccess andFailureBlocks:(NetDownLoadFailureBlock)registerFailure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    //申明返回的结果是json类型
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //申明请求的数据是json类型
//    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    NSDictionary *parameters = @{@"grant_type":@"password",
                                 @"username":email,
                                 @"password":password};
    
    NSString *url = @"http://101.200.232.88/Token";
    //发送请求
    [manager POST:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        TCLog(@"JSON: %@", responseObject);
        registerSuccess(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSHTTPURLResponse *response = [error.userInfo objectForKey:@"com.alamofire.serialization.response.error.response"];
        registerFailure([NSString stringWithFormat:@"%ld",(long)response.statusCode]);
        NSLog(@"Error: %ld", (long)response.statusCode);
    }];
    
}

- (void)verifyCodeWithCallNumber:(NSString *)number andSuccessBlocks:(NetDownLoadSuccessBlock)success andFailureBlocks:(NetDownLoadFailureBlock)failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //申明返回的结果是json类型
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //申明请求的数据是json类型
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    //传入的参数
    NSDictionary *parameters = @{@"Number":number};
    //你的接口地址
    //发送请求
    [manager POST:GetVerifyCode_URL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success([[responseObject  objectForKey:@"Data"] objectForKey:@"code"]);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure([NSString stringWithFormat:@"failed ! \noperation = %@ \n error = %@",operation,error]);
    }];
}

- (void)areaWithParentID:(NSString *)parentID andSuccessBlocks:(NetDownLoadSuccessArrayBlock)success andFailureBlocks:(NetDownLoadFailureBlock)failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //申明返回的结果是json类型
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [manager GET:GetAllCityWithPid(parentID) parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSNumber *successed = operation.responseObject[@"Successed"];                               
                               
        if ( [successed intValue] == 1) {
            
            NSArray *array = operation.responseObject[@"Data"];
            NSMutableArray *areaArray = [NSMutableArray arrayWithCapacity:array.count];
            for (NSDictionary *dic in array) {
                AreaModel *area = [AreaModel areaModelWithDic:dic];
                [areaArray addObject:area];
            }
            success(areaArray);
        } else {
            failure(@"获取地区失败!");
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"fail GetVerifyCode_URL operation %@",operation);
        NSLog(@"fail GetVerifyCode_URL error %@",error);
    }];
}

// Santor 2015.6.23
- (void)rentListWithPn:(NSString *)pn andSuccessBlocks:(NetDownLoadSuccessArrayBlock)success andFailureBlocks:(NetDownLoadFailureBlock)failure {
   
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //申明返回的结果是json类型
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //申明请求的数据是json类型
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [manager POST:RentListWithPN(pn) parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"success GetVerifyCode_URL operation %@",operation);
        NSLog(@"success GetVerifyCode_URL responseObject %@",responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    }];

}

- (void)rentDetailWithID:(NSString *)ID andSuccessBlocks:(NetDownLoadSuccessArrayBlock)success andFailureBlocks:(NetDownLoadFailureBlock)failure {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //申明返回的结果是json类型
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //申明请求的数据是json类型
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [manager POST:RentDetailWithID(ID) parameters:nil success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {
        if (responseObject[@"Successed"] == [NSNumber numberWithLong:1]) {
            success(responseObject[@"Data"]);
        } else {
            failure(responseObject[@"Message"]);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure([NSString stringWithFormat:@"%@",error]);
    }];
}

- (void)rentAddWithID:(NSString *)ID andTitle:(NSString *)title andPrice:(NSString *)price andBrowseCount:(NSString *)browseCount andArea:(NSString *)area andType:(NSString *)type andClostTo:(NSString *)closeTo andHistory:(NSString *)history andAddress:(NSString *)address andDescription:(NSString *)description andUserID:(NSString *)userID andSort:(NSString *)sort andCreatTime:(NSString *)createTime andState:(NSString *)state SuccessBlocks:(NetDownLoadSuccessArrayBlock)success andFailureBlocks:(NetDownLoadFailureBlock)failure {
    
    /*
     "Id": 1,
     "Title": "sample string 2",
     "Price": "sample string 3",
     "BrowseCount": 4,
     "Area": "sample string 5",
     "Type": "sample string 6",
     "CloseTo": "sample string 7",
     "Histroy": "sample string 8",
     "Address": "sample string 9",
     "Description": "sample string 10",
     "UserId": "sample string 11",
     "Sort": 12,
     "CreateTime": "2015-07-01T17:25:54.7689678+08:00",
     "State": 0
     */
    
    
    NSDictionary *parameters = @{@"Id": ID ,
                                 @"Title":title ,
                                 @"Price" : price,
                                 @"BrowseCount": browseCount ,
                                 @"Area":area ,
                                 @"Type":type ,
                                 @"CloseTo" : closeTo,
                                 @"Histroy": history ,
                                 @"Address":address ,
                                 @"Description":description ,
                                 @"UserId" : userID,
                                 @"Sort": sort ,
                                 @"CreateTime":createTime ,
                                 @"State":state
                                 };
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //申明返回的结果是json类型
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //申明请求的数据是json类型
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    //发送请求
    [manager POST:SET_PASSWORD_URL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSArray *arr = [[operation.responseObject objectForKey:@"ModelState"] objectForKey:@""];
        failure(arr.firstObject);
    }];



}

- (void)getHomeAdvertiseSuccessBlocks:(NetDownLoadSuccessDicBlock)success andFailureBlocks:(NetDownLoadFailureBlock)failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //申明返回的结果是json类型
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //申明请求的数据是json类型
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    //发送请求
    [manager GET:GET_HOMEINFO parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success([responseObject objectForKey:@"Data"]);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure([NSString stringWithFormat:@"%@",error]);
    }];
}

- (void)getTailListSuccessBlocks:(NetDownLoadSuccessArrayBlock)success andFailureBlocks:(NetDownLoadFailureBlock)failure
{
    NSDictionary *parameters = @{@"pn": @"1"
                                 };
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //申明返回的结果是json类型
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //申明请求的数据是json类型
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    //发送请求
    [manager POST:POST_TAILINFO parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success([responseObject objectForKey:@"Data"]);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure([NSString stringWithFormat:@"%@",error]);
    }];
}

- (void)categoryListWithSuccessBlocks:(NetDownLoadSuccessArrayBlock)success andFailureBlocks:(NetDownLoadFailureBlock)failure {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //申明返回的结果是json类型
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //申明请求的数据是json类型
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [manager POST:CategoryList parameters:nil success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {
        
        if ([responseObject[@"Successed"]  isEqual: @1]) {
            
            NSArray *dataArray = responseObject[@"Data"];
            NSMutableArray *returnArray = [NSMutableArray arrayWithCapacity:dataArray.count];
            for (NSDictionary *dataDic in dataArray) {
                CategoryModel *category = [[CategoryModel alloc] initWithDic:dataDic];
                [returnArray addObject:category];
            }
            success(returnArray);
        } else {
            failure(responseObject[@"Message"]);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(@"网络错误 ,请检查网络设置从新发送!");
    }];
}

- (void)categoryGetAllCompanyWithID:(NSString *)ID andSuccessBlocks:(NetDownLoadSuccessArrayBlock)success andFailureBlocks:(NetDownLoadFailureBlock)failure {
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager GET:CategoryGetAllCompanyWithID(ID) parameters:nil success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {
        
        if ([responseObject[@"Successed"]  isEqual: @1]) {
            
            NSArray *dataArray = responseObject[@"Data"];
            NSMutableArray *returnArray = [NSMutableArray arrayWithCapacity:dataArray.count];
            for (NSDictionary *dataDic in dataArray) {
                CompanyModel *company = [[CompanyModel alloc] initWithDic:dataDic];
                [returnArray addObject:company];
            }
            success(returnArray);
        } else {
            failure(responseObject[@"Message"]);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
}

- (void)getTailDetailInfoWithId:(NSString *)proId SuccessBlocks:(NetDownLoadSuccessDicBlock)success andFailureBlocks:(NetDownLoadFailureBlock)failure
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //申明返回的结果是json类型
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //申明请求的数据是json类型
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    //发送请求
    [manager POST:[NSString stringWithFormat:@"%@/%@",POST_TAILDETAIL,proId] parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success([responseObject objectForKey:@"Data"]);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure([NSString stringWithFormat:@"%@",error]);
    }];
}


@end
