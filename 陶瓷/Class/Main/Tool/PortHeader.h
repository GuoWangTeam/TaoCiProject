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

#define GET_HOMEINFO MAIN_PATH@"Home/Advertisement"

#define POST_TAILINFO MAIN_PATH@"TailGoods/List"

#define POST_TAILDETAIL MAIN_PATH@"TailGoods/Detail"

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
/**
 *  获取商铺详情
 */
#define RentDetailWithID(id) [NSString stringWithFormat:@"%@Rent/Detail/%@",MAIN_PATH,(id)]
/**
 *  增加商铺信息
 */
#define RentAdd MAIN_PATH@"Rent/Add"
/**
 *  获取分类列表
 */
#define CategoryList MAIN_PATH@"Category/List"
/**
 *  根据分类获取公司列表
 */
#define CategoryGetAllCompanyWithID(id) [NSString stringWithFormat:@"%@Category/GetAllCompany?categoryId=%@",MAIN_PATH,(id)]