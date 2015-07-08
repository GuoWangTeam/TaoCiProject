//
//  CategoryModel.h
//  陶瓷
//
//  Created by 王戈 on 15/7/6.
//  Copyright (c) 2015年 王戈. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CategoryModel : NSObject

@property (nonatomic ,copy) NSString *IconUrl;
@property (nonatomic ,copy) NSString *Id;
@property (nonatomic ,copy) NSString *Name;
@property (nonatomic ,copy) NSString *Sort;
@property (nonatomic ,copy) NSString *TopCompany;
@property (nonatomic ,copy) NSString *TopCompanyId;
@property (nonatomic ,copy) NSString *TopCompanyImageUrl;

- (instancetype)initWithDic:(NSDictionary *)dic;

@end
