//
//  TCNetworkTool.h
//  demo
//
//  Created by 王戈 on 15/6/10.
//  Copyright (c) 2015年 nice. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^NetDownLoadFailureBlock)(NSString *failureMessage);
typedef void (^NetDownLoadSuccessBlock)(NSString *successMessage);
typedef void (^NetDownLoadSuccessIdBlock)(id successMessage);
typedef void (^NetDownLoadSuccessArrayBlock)(NSArray *resultArray);
typedef void (^NetDownLoadSuccessDicBlock)(NSDictionary *resultDic);

@interface TCNetworkTool : NSObject

+ (TCNetworkTool *)sharedNetTool;
/**
 *  修改密码
 *
 *  @param oldPassword     旧密码
 *  @param newPassword     新密码
 *  @param confirmPassword 确认密码
 */
- (void) modifyPasswordWithOldPassword:(NSString *)oldPassword newPasswork:(NSString *)newPassword confirmPassword:(NSString *)confirmPassword
                      andSuccessBlocks:(NetDownLoadSuccessBlock)modifySuccess andFailureBlocks:(NetDownLoadFailureBlock)modifyFailure;

/**
 *  注册
 *
 *  @param email           用户邮箱
 *  @param password        密码
 *  @param confirmPassword 确认密码
 *  @param verifyCode      手机确认码
 *  @param CityId          城市ID
 */
- (void)registerWithEmail:(NSString *)email password:(NSString *)password confirmPassword:(NSString *)confirmPassword verifyCode:(NSString *)verifyCode CityId:(NSString *)CityId
         andSuccessBlocks:(NetDownLoadSuccessBlock)modifySuccess andFailureBlocks:(NetDownLoadFailureBlock)modifyFailure;

/**
 *  重置密码
 *
 *  @param password        新密码
 *  @param confirmPassword 确认密码
 */
- (void)setPassword:(NSString *)password confirmPassword:(NSString *)confirmPassword
   andSuccessBlocks:(NetDownLoadSuccessBlock)modifySuccess andFailureBlocks:(NetDownLoadFailureBlock)modifyFailure;

/**
 *  获取验证码
 *
 *  @param number        手机号码
 */
- (void)verifyCodeWithCallNumber:(NSString *)number andSuccessBlocks:(NetDownLoadSuccessBlock)success andFailureBlocks:(NetDownLoadFailureBlock)failure;

/**
 *  获取区域信息
 *
 *  @param parentID 父类ID 默认为1
 */
- (void)areaWithParentID:(NSString *)parentID andSuccessBlocks:(NetDownLoadSuccessArrayBlock)success andFailureBlocks:(NetDownLoadFailureBlock)failure;

/**
 *  登录
 *
 *  @param email           用户名
 *  @param password        密码
 */
- (void)tokenWithEmail:(NSString *)email password:(NSString *)password andSuccessBlocks:(NetDownLoadSuccessIdBlock)registerSuccess andFailureBlocks:(NetDownLoadFailureBlock)registerFailure;

#pragma mark - 商铺相关
/**
 *  获取商铺列表
 *
 *  @param pn      商铺列表
 */
- (void)rentListWithPn:(NSString *)pn andSuccessBlocks:(NetDownLoadSuccessArrayBlock)success andFailureBlocks:(NetDownLoadFailureBlock)failure;
/**
 *  获取商铺详细信息
 *
 *  @param ID      商铺ID
 */
- (void)rentDetailWithID:(NSString *)ID andSuccessBlocks:(NetDownLoadSuccessArrayBlock)success andFailureBlocks:(NetDownLoadFailureBlock)failure;

/**
 *  发布商铺
 *
 *  @param ID          <#ID description#>
 *  @param title       <#title description#>
 *  @param price       <#price description#>
 *  @param browseCount <#browseCount description#>
 *  @param area        <#area description#>
 *  @param type        <#type description#>
 *  @param closeTo     <#closeTo description#>
 *  @param history     <#history description#>
 *  @param address     <#address description#>
 *  @param description <#description description#>
 *  @param userID      <#userID description#>
 *  @param sort        <#sort description#>
 *  @param createTime  <#createTime description#>
 *  @param state       <#state description#>
 *  @param success     <#success description#>
 *  @param failure     <#failure description#>
 */

- (void)rentAddWithID:(NSString *)ID andTitle:(NSString *)title andPrice:(NSString *)price andBrowseCount:(NSString *)browseCount andArea:(NSString *)area andType:(NSString *)type andClostTo:(NSString *)closeTo andHistory:(NSString *)history andAddress:(NSString *)address andDescription:(NSString *)description andUserID:(NSString *)userID andSort:(NSString *)sort andCreatTime:(NSString *)createTime andState:(NSString *)state SuccessBlocks:(NetDownLoadSuccessArrayBlock)success andFailureBlocks:(NetDownLoadFailureBlock)failure;



/**
 *  首页
 *
 */
- (void)getHomeAdvertiseSuccessBlocks:(NetDownLoadSuccessDicBlock)success andFailureBlocks:(NetDownLoadFailureBlock)failure;
/**
 *  尾货
 *
 */
- (void)getTailListSuccessBlocks:(NetDownLoadSuccessArrayBlock)success andFailureBlocks:(NetDownLoadFailureBlock)failure;

/**
 *  尾货详情
 *
 *  @param proId   尾货ID
 *  @param success 成功
 *  @param failure 失败
 */
- (void)getTailDetailInfoWithId:(NSString *)proId SuccessBlocks:(NetDownLoadSuccessDicBlock)success andFailureBlocks:(NetDownLoadFailureBlock)failure;

/**
 *  获取分类列表
 */
- (void)categoryListWithSuccessBlocks:(NetDownLoadSuccessArrayBlock)success andFailureBlocks:(NetDownLoadFailureBlock)failure;

/**
 *  根据分类获取公司详细信息
 *
 *  @param ID      分类ID
 */
- (void)categoryGetAllCompanyWithID:(NSString *)ID andSuccessBlocks:(NetDownLoadSuccessArrayBlock)success andFailureBlocks:(NetDownLoadFailureBlock)failure;


@end
