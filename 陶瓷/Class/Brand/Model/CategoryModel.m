//
//  CategoryModel.m
//  陶瓷
//
//  Created by 王戈 on 15/7/6.
//  Copyright (c) 2015年 王戈. All rights reserved.
//

#import "CategoryModel.h"

@implementation CategoryModel

- (instancetype)initWithDic:(NSDictionary *)dic {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

@end
