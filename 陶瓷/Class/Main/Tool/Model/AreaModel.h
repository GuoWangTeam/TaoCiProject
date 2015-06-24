//
//  AreaModel.h
//  陶瓷
//
//  Created by 王戈 on 15/6/15.
//  Copyright (c) 2015年 王戈. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AreaModel : NSObject

/**
 *  地区ID
 */
@property (nonatomic ,copy) NSString *ID;
/**
 *  地区名称
 */
@property (nonatomic ,copy) NSString *name;
/**
 *  上一级地区ID (省级ID)
 */
@property (nonatomic ,copy) NSString *parentID;
/**
 *  地区级别 , 1为省, 2为城市
 */
@property (nonatomic ,copy) NSString *type;

+ (instancetype)areaModelWithDic:(NSDictionary *)dic;

@end
