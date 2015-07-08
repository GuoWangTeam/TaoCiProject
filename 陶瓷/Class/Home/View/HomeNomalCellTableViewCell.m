//
//  HomeNomalCellTableViewCell.m
//  陶瓷
//
//  Created by 郭天龙 on 15/7/6.
//  Copyright (c) 2015年 王戈. All rights reserved.
//

#import "HomeNomalCellTableViewCell.h"
#import "UIImageView+WebCache.h"

@interface HomeNomalCellTableViewCell ()

@property (nonatomic, strong) HomeCellModel *model;

@end

@implementation HomeNomalCellTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModelWithDic:(NSDictionary *)dic
{
    self.model = [[HomeCellModel alloc] init];
    self.model.Height = [dic objectForKey:@"Height"];
    self.model.name = [dic objectForKey:@"Name"];
    self.model.adverArr = [dic objectForKey:@"Advertisements"];
    self.model.idnum = [dic objectForKey:@"Id"];
    
    CGFloat width = kDefaultWindowWidth/[self.model.adverArr count];
    int i = 0;
    for (NSDictionary *dic in self.model.adverArr) {
        UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(i*width, 0, width, self.model.Height.floatValue/2)];
        [imageview sd_setImageWithURL:[dic objectForKey:@"ImageUrl"] placeholderImage:nil];
        i++;
        [self addSubview:imageview];
    }
    
}

@end
