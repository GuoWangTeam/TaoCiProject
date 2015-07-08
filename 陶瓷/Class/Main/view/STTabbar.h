//
//  STTabbar.h
//  02-weibo
//
//  Created by 王戈 on 14-7-10.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol STTabbarDelegate <NSObject>

- (void)tabbarPlusBtnClick;

@end
@interface STTabbar : UITabBar
@property (nonatomic ,weak)id<STTabbarDelegate> delegate1;


@end
