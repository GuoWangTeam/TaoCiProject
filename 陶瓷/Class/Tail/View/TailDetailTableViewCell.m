//
//  TailDetailTableViewCell.m
//  陶瓷
//
//  Created by 郭天龙 on 15/7/7.
//  Copyright (c) 2015年 王戈. All rights reserved.
//

#import "TailDetailTableViewCell.h"

@interface TailDetailTableViewCell ()

@property (nonatomic, weak) IBOutlet UILabel *label1;
@property (nonatomic, weak) IBOutlet UILabel *label2;
@property (nonatomic, weak) IBOutlet UILabel *label3;
@property (nonatomic, weak) IBOutlet UILabel *label4;
@property (nonatomic, weak) IBOutlet UILabel *label5;
@property (nonatomic, weak) IBOutlet UILabel *label6;
@property (nonatomic, weak) IBOutlet UILabel *label7;

@end

@implementation TailDetailTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel:(NSDictionary *)dic
{
    self.label1.text = [NSString stringWithFormat:@"品牌：%@",[dic objectForKey:@"Brand"]];
    self.label2.text = [NSString stringWithFormat:@"规格：%@",[dic objectForKey:@"Standard"]];
    self.label3.text = [NSString stringWithFormat:@"数量：%@",[dic objectForKey:@"Count"]];
    self.label4.text = [NSString stringWithFormat:@"价格：%@",[dic objectForKey:@"Price"]];
    self.label5.text = [NSString stringWithFormat:@"联系人：%@",[dic objectForKey:@"LinkMan"]];
    self.label6.text = [NSString stringWithFormat:@"联系电话：%@",[dic objectForKey:@"ContactNumber"]];
    self.label7.text = [NSString stringWithFormat:@"公司地址：%@",[dic objectForKey:@"CompanyAddress"]];
}

@end
