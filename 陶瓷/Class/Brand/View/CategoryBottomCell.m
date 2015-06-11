//
//  CategoryBottomCell.m
//  陶瓷
//
//  Created by 王戈 on 15/6/9.
//  Copyright (c) 2015年 王戈. All rights reserved.
//

#import "CategoryBottomCell.h"
#import "CategoryBtn.h"

@interface CategoryBottomCell ()

@property (nonatomic, strong) CategoryBtn *leftBtn;
@property (nonatomic, strong) CategoryBtn *rightBtn;

@end

@implementation CategoryBottomCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.leftBtn];
        [self.contentView addSubview:self.rightBtn];
    }
    return self;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *identifier = @"CategoryBottomCell";
    // 1.取缓存中取
    CategoryBottomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.创建cell
    if (cell == nil) {
         cell = [[CategoryBottomCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    return cell;
}

- (CategoryBtn *)leftBtn {
    if (_leftBtn == nil) {
        _leftBtn = [[CategoryBtn alloc] initWithIsContainIcon:YES];
        [_leftBtn setImage:[UIImage imageNamed:@"cate"] forState:UIControlStateNormal];
        [_leftBtn setTitle:@"hehe" forState:UIControlStateNormal];
    }
    return _leftBtn;
}

- (CategoryBtn *)rightBtn {
    if (_rightBtn == nil) {
        _rightBtn = [[CategoryBtn alloc] initWithIsContainIcon:YES];
        [_rightBtn setImage:[UIImage imageNamed:@"ad"] forState:UIControlStateNormal];
        [_rightBtn setTitle:@"haha" forState:UIControlStateNormal];
    }
    return _rightBtn;
}

- (void)setIsNeedIcon:(BOOL)isNeedIcon
{
    _isNeedIcon = isNeedIcon;
    
    self.rightBtn.isContainIcon = isNeedIcon;
    self.leftBtn.isContainIcon = isNeedIcon;
    [self layoutIfNeeded];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _leftBtn.frame = CGRectMake(self.width * 0.11, self.height * 0.16, self.width * 0.26, self.height * 0.68);
    _rightBtn.frame = CGRectMake(self.width * 0.6, self.height * 0.16, self.width * 0.26, self.height * 0.68);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
