//
//  UIColor+NSString.h
//  陶瓷
//
//  Created by 郭天龙 on 15/6/14.
//  Copyright (c) 2015年 王戈. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (NSString)
//以#开头的字符串（不区分大小写），如：#ffFFff，若需要alpha，则传#abcdef255，不传默认为1
+ (UIColor *)colorWithString:(NSString *)name;
@end
