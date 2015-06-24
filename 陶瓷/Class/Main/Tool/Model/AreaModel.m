//
//  AreaModel.m
//  陶瓷
//
//  Created by 王戈 on 15/6/15.
//  Copyright (c) 2015年 王戈. All rights reserved.
//

#import "AreaModel.h"

@implementation AreaModel

/*
 字典model
 Id = 2;
 Name = "\U5317\U4eac";
 ParentId = 1;
 Type = 1;
 */

- (instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        self.ID = dic[@"Id"];
        self.name = dic[@"Name"];
        self.parentID = dic[@"ParentId"];
        self.type = dic[@"Type"];
    }
    return self;
}


+ (instancetype)areaModelWithDic:(NSDictionary *)dic
{
    return [[self alloc] initWithDic:dic];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"<id = %@ , name = %@ , parentID = %@ ,type = %@>", _ID, _name, _parentID, _type];
}
@end
