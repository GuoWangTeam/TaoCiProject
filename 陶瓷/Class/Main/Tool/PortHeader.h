//
//  PortHeader.h
//  demo
//
//  Created by 王戈 on 15/6/10.
//  Copyright (c) 2015年 nice. All rights reserved.
//

/**
 *  主路径
 */
#define MAIN_PATH @"http://101.200.232.88/"
/**
 * 登出
 */
#define LOGOUT_URL MAIN_PATH@"Account/Logout"
/**
 *  注册
 */
#define REGISTER_URL MAIN_PATH@"Account/Register"
/**
 *  设置密码
 */
#define SET_PASSWORD_URL MAIN_PATH@"Account/SetPassword"

#define GET_USERINFO MAIN_PATH@"Account/GetUserInfo"

/**
 *  获取验证码
 */
#define GetVerifyCode_URL MAIN_PATH@"Account/GetVerifyCode"

/**
 *  获取地域信息
 */
#define GetAllCityWithPid(pid) [NSString stringWithFormat:@"%@Area/GetAllCity?pid=%@",MAIN_PATH,(pid)]
/**
 *  获取商铺信息
 */
#define RentListWithPN(pn) [NSString stringWithFormat:@"%@Rent/List?pn=%@",MAIN_PATH,(pn)]