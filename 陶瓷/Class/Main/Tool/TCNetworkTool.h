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
 */
- (void)registerWithEmail:(NSString *)email password:(NSString *)password confirmPassword:(NSString *)confirmPassword
         andSuccessBlocks:(NetDownLoadSuccessBlock)modifySuccess andFailureBlocks:(NetDownLoadFailureBlock)modifyFailure;

/**
 *  重置密码
 *
 *  @param password        新密码
 *  @param confirmPassword 确认密码
 */
- (void)setPassword:(NSString *)password confirmPassword:(NSString *)confirmPassword
   andSuccessBlocks:(NetDownLoadSuccessBlock)modifySuccess andFailureBlocks:(NetDownLoadFailureBlock)modifyFailure;

@end
