//
//  HomeHeaderView.m
//  陶瓷
//
//  Created by 郭天龙 on 15/6/13.
//  Copyright (c) 2015年 王戈. All rights reserved.
//

#import "HomeHeaderView.h"
#import "HomeHeaderModel.h"
#import "UIImageView+WebCache.h"

@interface HomeHeaderView ()<UIScrollViewDelegate>

@property (nonatomic, weak) IBOutlet UIScrollView *scrollView;
@property (nonatomic, weak) IBOutlet UIPageControl *pageControl;
@property (nonatomic, strong) NSArray *modelArr;

@property (nonatomic, strong) NSMutableArray *imageArray;
@property (nonatomic, strong) NSArray *imageBasicArr;

@property (nonatomic, strong) NSTimer *scrollTimer;
@property (nonatomic, assign) NSTimeInterval timerFreq;
@property (nonatomic, assign) NSTimeInterval pageLoadTime;
@property (nonatomic, assign) BOOL stopForeverFlag;
@property (nonatomic, assign) int currentPage;

@end

@implementation HomeHeaderView

- (void)setArray:(NSArray *)arr
{
    self.imageArray = [[NSMutableArray alloc] initWithCapacity:[arr count]];
    self.modelArr = [arr mutableCopy];
    self.scrollView.contentSize = CGSizeMake(kDefaultWindowWidth*[arr count], 140);
    CGRect imageframe = CGRectMake(0, 0, kDefaultWindowWidth, 140);
    
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.pagingEnabled = YES;
    
    for (int i = 0 ; i < [arr count] ; i++)
    {
        NSDictionary *dic = [arr objectAtIndex:i];
        imageframe.origin.x = i*kDefaultWindowWidth;
        UIImageView *imageview = [[UIImageView alloc] initWithFrame:imageframe];
        [imageview sd_setImageWithURL:[NSURL URLWithString:[dic objectForKey:@"ImageUrl"]] placeholderImage:[UIImage imageNamed:@""]];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.backgroundColor = [UIColor clearColor];
        btn.frame = imageframe;
        btn.tag = i;
        [btn addTarget:self action:@selector(clickAdvertiseImage:) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollView addSubview:imageview];
        [self.scrollView addSubview:btn];
        [self.imageArray addObject:imageview];
    }
    
    self.imageBasicArr = [NSArray arrayWithArray:self.imageArray];
    
    self.currentPage = 1;
    
}

- (void)setUpAutoScorllTimerFreq:(NSTimeInterval)freq pageloadTime:(NSTimeInterval) seconds
{
    self.pageLoadTime = seconds;
    self.timerFreq = freq;
    [self startScrolling];
}

- (void)startScrolling
{
    [self.scrollTimer invalidate];
    self.scrollTimer = [NSTimer scheduledTimerWithTimeInterval:self.timerFreq
                                                            target:self
                                                          selector:@selector(scrollStep)
                                                          userInfo:nil
                                                           repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:_scrollTimer forMode:NSDefaultRunLoopMode];
    [[NSRunLoop mainRunLoop] addTimer:_scrollTimer forMode:UITrackingRunLoopMode];
}

- (void)scrollStep
{
    if (!self.scrollView.dragging && !self.scrollView.decelerating)
    {
        [self  scrollToPage:self.currentPage+1 duration:self.pageLoadTime];
    }
}

- (void)scrollToPage:(NSInteger)page duration:(NSTimeInterval)duration
{
    if (page < [self.modelArr count]) {
        [self.scrollView setContentOffset:CGPointMake(kDefaultWindowWidth*page, self.scrollView.contentOffset.y) animated:YES];
    }
    else
    {
        [self.scrollView scrollRectToVisible:CGRectMake(0, 0, kDefaultWindowWidth, self.height) animated:NO];
    }
}

- (void)stopAutoScorll
{
    [self.scrollTimer invalidate];
    self.scrollTimer = nil;
}

- (void)clickAdvertiseImage:(UIButton *)button
{
    if ([self.delegate respondsToSelector:@selector(didAdvertiseButton:)]) {
        [self.delegate didAdvertiseButton:[self.modelArr objectAtIndex:button.tag]];
    }
}


- (void)awakeFromNib
{
    
    
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
//    if ([self.modelArr count] > 1) {
//        if(scrollView.contentOffset.x < 0)
//        {
//            
//        }
//        else
//        {
//            
//        }
//    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView;
{
//    self.currentPage = (int)(self.scrollView.contentOffset.x+kDefaultWindowWidth)/kDefaultWindowWidth;
//    if (self.currentPage == [self.modelArr count]) {
//        [self.scrollView scrollRectToVisible:CGRectMake(0, 0, kDefaultWindowWidth, self.height) animated:NO];
//        
//        for (int i = 0 ; i < [self.imageArray count]; i++) {
//            UIImageView *image = [self.imageArray objectAtIndex:i];
//            if (image.frame.origin.x/kDefaultWindowWidth == ([self.imageArray count] - 1)) {
//                image.frame = CGRectMake(0, 0, kDefaultWindowWidth, self.height);
//                NSLog(@"1=====%@",image);
//            }
//            else
//            {
//                image.frame = CGRectMake(kDefaultWindowWidth*(i+1), 0, kDefaultWindowWidth, self.height);
//                NSLog(@"%@",image);
//            }
//        }
//    }
}


@end
