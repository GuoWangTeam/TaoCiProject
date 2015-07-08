//
//  HomeHeadTableViewCell.m
//  陶瓷
//
//  Created by 郭天龙 on 15/6/13.
//  Copyright (c) 2015年 王戈. All rights reserved.
//

#import "HomeHeadTableViewCell.h"
#import "HomeCategoryModel.h"
#import "UIButton+WebCache.h"

@interface HomeHeadTableViewCell ()

@property (nonatomic, weak) IBOutlet UIButton *button1;
@property (nonatomic, weak) IBOutlet UIButton *button2;
@property (nonatomic, weak) IBOutlet UIButton *button3;
@property (nonatomic, weak) IBOutlet UIButton *button4;
@property (nonatomic, weak) IBOutlet UIButton *button5;
@property (nonatomic, weak) IBOutlet UIButton *button6;
@property (nonatomic, weak) IBOutlet UIButton *button7;
@property (nonatomic, weak) IBOutlet UIButton *button8;
@property (nonatomic, weak) IBOutlet UILabel *categoryLabel1;
@property (nonatomic, weak) IBOutlet UILabel *categoryLabel2;
@property (nonatomic, weak) IBOutlet UILabel *categoryLabel3;
@property (nonatomic, weak) IBOutlet UILabel *categoryLabel4;
@property (nonatomic, weak) IBOutlet UILabel *categoryLabel5;
@property (nonatomic, weak) IBOutlet UILabel *categoryLabel6;
@property (nonatomic, weak) IBOutlet UILabel *categoryLabel7;
@property (nonatomic, weak) IBOutlet UILabel *categoryLabel8;

@property (nonatomic, strong) NSArray *modelArr;

@end

@implementation HomeHeadTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setArray:(NSArray *)arr
{
    self.modelArr = [arr mutableCopy];
    if ([arr count] == 8) {
        NSDictionary *dic1 = [arr objectAtIndex:0];
        [self.button1 sd_setImageWithURL:[NSURL URLWithString:[dic1 objectForKey:@"ImageUrl"]] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@""]];
        self.categoryLabel1.text = [dic1 objectForKey:@"Name"];
        NSDictionary *dic2 = [arr objectAtIndex:1];
        [self.button2 sd_setImageWithURL:[NSURL URLWithString:[dic2 objectForKey:@"ImageUrl"]] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@""]];
        self.categoryLabel2.text = [dic2 objectForKey:@"Name"];
        NSDictionary *dic3 = [arr objectAtIndex:2];
        [self.button3 sd_setImageWithURL:[NSURL URLWithString:[dic3 objectForKey:@"ImageUrl"]] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@""]];
        self.categoryLabel3.text = [dic3 objectForKey:@"Name"];
        NSDictionary *dic4 = [arr objectAtIndex:3];
        [self.button4 sd_setImageWithURL:[NSURL URLWithString:[dic4 objectForKey:@"ImageUrl"]] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@""]];
        self.categoryLabel4.text = [dic4 objectForKey:@"Name"];
        NSDictionary *dic5 = [arr objectAtIndex:4];
        [self.button5 sd_setImageWithURL:[NSURL URLWithString:[dic5 objectForKey:@"ImageUrl"]] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@""]];
        self.categoryLabel5.text = [dic5 objectForKey:@"Name"];
        NSDictionary *dic6 = [arr objectAtIndex:5];
        [self.button6 sd_setImageWithURL:[NSURL URLWithString:[dic6 objectForKey:@"ImageUrl"]] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@""]];
        self.categoryLabel6.text = [dic6 objectForKey:@"Name"];
        NSDictionary *dic7 = [arr objectAtIndex:6];
        [self.button7 sd_setImageWithURL:[NSURL URLWithString:[dic7 objectForKey:@"ImageUrl"]] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@""]];
        self.categoryLabel7.text = [dic7 objectForKey:@"Name"];
        NSDictionary *dic8 = [arr objectAtIndex:7];
        [self.button8 sd_setImageWithURL:[NSURL URLWithString:[dic8 objectForKey:@"ImageUrl"]] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@""]];
        self.categoryLabel8.text = [dic8 objectForKey:@"Name"];
    }
}

- (IBAction)clickCateBtn:(UIButton *)button
{
    if ([self.delegate respondsToSelector:@selector(didCategoryButton:)]) {
        [self.delegate didCategoryButton:nil];
    }
}

@end
