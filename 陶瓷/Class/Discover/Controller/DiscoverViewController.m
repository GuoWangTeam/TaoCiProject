//
//  DiscoverViewController.m
//  陶瓷
//
//  Created by 郭天龙 on 15/7/6.
//  Copyright (c) 2015年 王戈. All rights reserved.
//

#import "DiscoverViewController.h"

@interface DiscoverViewController ()

@property (nonatomic, strong) IBOutlet UITableView *tableview;
@property (nonatomic, strong) NSArray *arrayDataSource;

@end

@implementation DiscoverViewController

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.arrayDataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"discoverCellId"];
    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"HomeHeadTableViewCell" owner:nil options:nil].firstObject;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",[self.arrayDataSource objectAtIndex:indexPath.row]]]];
        imageView.frame = CGRectMake(0, 0, kDefaultWindowWidth, 70);
        [cell.contentView addSubview:imageView];
    }
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            NSLog(@"0");
        }
            break;
        case 1:
        {
            NSLog(@"1");
        }
            break;
        case 2:
        {
            NSLog(@"2");
        }
            break;
        case 3:
        {
            NSLog(@"3");
        }
            break;
        case 4:
        {
            NSLog(@"4");
        }
            break;
            
        default:
            break;
    }
}


#pragma mark - lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    self.title = @"发现更多";
    [self.navigationItem setTitle:@"发现更多"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"discoverTitle"]];
    imageView.frame = CGRectMake(0, 0, kDefaultWindowWidth, 140);
    self.tableview.tableHeaderView = imageView;
    
    self.arrayDataSource = [[NSArray alloc] initWithObjects:@"human",@"rent",@"market",@"send",@"game", nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
