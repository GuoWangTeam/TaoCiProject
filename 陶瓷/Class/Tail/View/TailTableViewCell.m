//
//  TailTableViewCell.m
//  陶瓷
//
//  Created by 郭天龙 on 15/7/7.
//  Copyright (c) 2015年 王戈. All rights reserved.
//

#import "TailTableViewCell.h"
#import "UIImageView+WebCache.h"

@interface TailTableViewCell ()

@property (nonatomic, weak) IBOutlet UIImageView *titleImage;
@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *countLabel;
@property (nonatomic, weak) IBOutlet UILabel *priceLabel;

@end

@implementation TailTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(NSDictionary *)dic
{
    [self.titleImage sd_setImageWithURL:[dic objectForKey:@"HeadImageUrl"] placeholderImage:nil];
    self.nameLabel.text = [NSString stringWithFormat:@"%@  规格 %@",[dic objectForKey:@"Brand"],[dic objectForKey:@"Standard"]];
    self.countLabel.text = [NSString stringWithFormat:@"数量：%@",[dic objectForKey:@"Count"]];
    self.priceLabel.text = [NSString stringWithFormat:@"¥:%@元",[dic objectForKey:@"Price"]];
}

@end
