//
//  CompanyModel.h
//  陶瓷
//
//  Created by 王戈 on 15/7/7.
//  Copyright (c) 2015年 王戈. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CompanyModel : NSObject

@property (nonatomic ,copy) NSString *Address;
@property (nonatomic ,copy) NSString *Brand;
@property (nonatomic ,copy) NSString *CategoryId;
@property (nonatomic ,copy) NSString *ContactNumber;
@property (nonatomic ,copy) NSString *HeadImageUrl;
@property (nonatomic ,copy) NSString *Id;
@property (nonatomic ,copy) NSString *LinkMan;
@property (nonatomic ,copy) NSString *Market;
@property (nonatomic ,copy) NSString *MarketId;
@property (nonatomic ,copy) NSString *Name;

- (instancetype)initWithDic:(NSDictionary *)dic ;

@end
